import 'package:boycott_app/modules/home/cubit/home_cubit.dart';
import 'package:boycott_app/modules/home/view/product_view.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    final cubit = context.read<HomeCubit>();
    if (cubit.state is! HomeSuccess) {
      cubit.getCompanies();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        forceMaterialTransparency: true,
        title: Text('Boycott product', style: AppTypography.black22w500),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.red,
                  hintText: "Search",
                  suffixIcon: Icon(CupertinoIcons.search),
                  border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 8),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return switch (state) {
                    HomeInitial() || HomeLoading() => const Center(child: CircularProgressIndicator()),
                    HomeSuccess() => Expanded(
                      child: GridView.builder(
                        itemCount: state.companiesModel.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 190,
                        ),
                        itemBuilder: (context, index) {
                          final company = state.companiesModel.data[index];
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductView(companiesDataModel: company)),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(2),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 4)],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Image.network(
                                    'https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=612x612&w=0&k=20&c=l15OdMWjgCKycMMShP8UK94ELVlEGvt7GmB_esHWPYE=',
                                    width: double.infinity,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  // LogoImage(
                                  //   url: company.logo?.url,
                                  //   type: company.logo?.type,
                                  //   height: 100,
                                  //   width: double.infinity,
                                  // ),
                                  Center(
                                    child: Text(
                                      company.name!,
                                      style: AppTypography.black14,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    HomeError() => Center(child: Text(state.exception.toString())),
                  };
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//! fix error
class LogoImage extends StatelessWidget {
  final String? url;
  final String? type;
  final double width;
  final double height;
  final BoxFit fit;

  const LogoImage({
    super.key,
    required this.url,
    required this.type,
    this.width = double.infinity,
    this.height = 100,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    // Agar URL null yoki bo‘sh bo‘lsa — fallback belgisi chiqsin
    if (url == null || url!.isEmpty) {
      return const Icon(Icons.broken_image, size: 48, color: Colors.grey);
    }

    // SVG format
    if (type == 'image/svg+xml' || url!.endsWith('.svg')) {
      return SvgPicture.network(
        url!,
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder: (context) => const Center(child: CircularProgressIndicator()),
      );
    }

    // Boshqa formatlar (JPEG, PNG, WebP, ...)
    return CachedNetworkImage(
      imageUrl: url!,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, _) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, _, __) => const Icon(Icons.broken_image, size: 16, color: Colors.grey),
    );
  }
}
