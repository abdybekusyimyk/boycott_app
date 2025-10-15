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
  final TextEditingController _controller = TextEditingController();

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
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 4)],
                ),
                child: TextField(
                  controller: _controller,
                  onSubmitted: _performSearch,
                  onChanged: (query) {
                    if (query.isEmpty) {
                      context.read<HomeCubit>().getCompanies();
                    } else {
                      _performSearch(query);
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.white,
                    hintText: "Search",
                    suffixIcon: IconButton(
                      onPressed: () => _performSearch(_controller.text),
                      icon: const Icon(CupertinoIcons.search),
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              SizedBox(height: 8),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return switch (state) {
                    HomeInitial() || HomeLoading() => const Center(
                      child: Padding(padding: EdgeInsets.only(top: 100), child: CircularProgressIndicator()),
                    ),
                    HomeSuccess() =>
                      state.companiesModel.data.isEmpty
                          ? Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 100),
                                child: Text('No item', style: AppTypography.darkGreen18w600),
                              ),
                            )
                          : Expanded(
                              child: GridView.builder(
                                itemCount: state.companiesModel.data.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 190,
                                ),
                                padding: EdgeInsets.only(bottom: 30),
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
                                        boxShadow: [
                                          BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 4),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          LogoImage(url: company.logo?.url, type: company.logo?.type, height: 100),
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

  void _performSearch(String query) {
    final cubit = context.read<HomeCubit>();
    cubit.searchCompanies(query);
  }
}

const String _kFallbackImageUrl =
    'https://previews.123rf.com/images/newdesignillustrations/newdesignillustrations1902/newdesignillustrations190203038/116197254-boycott-seal-print-with-corroded-texture-red-vector-rubber-print-of-boycott-caption-with-scratched.jpg';

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
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      return CachedNetworkImage(
        imageUrl: _kFallbackImageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder: (context, _) => const Center(child: CircularProgressIndicator(strokeWidth: 1)),
        errorWidget: (context, _, __) => const Icon(Icons.error_outline, size: 20, color: Colors.redAccent),
      );
    }

    final bool isSvg = (type == 'image/svg+xml' || url!.toLowerCase().endsWith('.svg'));

    if (isSvg) {
      try {
        return SvgPicture.network(
          url!,
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder: (context) => const Center(child: CircularProgressIndicator(strokeWidth: 1)),
        );
      } catch (e) {
        debugPrint('SVG load error: $e. Falling back to default image.');
        return CachedNetworkImage(imageUrl: _kFallbackImageUrl, width: width, height: height, fit: BoxFit.contain);
      }
    }
    return CachedNetworkImage(
      imageUrl: url!,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, _) => const Center(child: CircularProgressIndicator(strokeWidth: 1)),
      errorWidget: (context, _, __) =>
          CachedNetworkImage(imageUrl: _kFallbackImageUrl, width: width, height: height, fit: BoxFit.contain),
    );
  }
}
