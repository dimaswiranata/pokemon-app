import 'package:flutter/material.dart';
import 'package:nexus_app/core/index.dart';
import 'package:nexus_app/screen/index.dart';

class PekemonScreen extends StatefulWidget {
  const PekemonScreen({super.key});

  @override
  State<PekemonScreen> createState() => _PekemonScreenState();
}

class _PekemonScreenState extends State<PekemonScreen> {
  bool _showShimmer = true;
  bool _showContent = false;

  double? _cardWidth;
  double? _cardWidthLandscape;

  List<Pokemon> _pokemon = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    Map<String, dynamic>? result = await PokemonRequest().getPokemon();

    if (!mounted) return;
    if (result != null) {
      _setData(result['results']);
    }

    _hideShimmer();
  }

  void _setData(List<dynamic> data) {
    setState(() {
      _pokemon.addAll(List<Pokemon>.from(data.map((x) => Pokemon.fromJson(x))));
    });
  }

  void _hideShimmer() async {
    await Future.delayed(Duration(milliseconds: 400), () async {
      if (!mounted) return;
      setState(() {
        _showShimmer = false;
      });
      await Future.delayed(Duration(milliseconds: 400), () {
        if (!mounted) return;
        setState(() {
          _showContent = true;
        });
      });
    });
  }

  Widget _buildShimmer() {
    if (_showContent == true) return Container();
    return AntiAnimatedOpacity(
        type: OpacityType.FADE_OUT,
        milliseconds: 400,
        isSelected: !_showShimmer,
        child: OrientationBuilder(builder: (context, orientation) {
          return AntiContainer(isScrollable: true, paddingHorizontal: space.reg, children: [
            SizedBox(
              height: Common.getDinamicTopSize(context) + space.xxl,
            ),
            AntiShimmer(
              width: 120,
              type: ShimmerType.h1,
            ),
            SizedBox(
              height: space.xxl,
            ),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                  crossAxisSpacing: space.reg,
                  mainAxisSpacing: space.reg,
                  childAspectRatio: 93 / 65,
                ),
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return AntiShimmer(
                    width: orientation == Orientation.portrait ? (_cardWidth ?? 0.0) : (_cardWidthLandscape ?? 0.0),
                    height: (orientation == Orientation.portrait ? (_cardWidth ?? 0.0) : (_cardWidthLandscape ?? 0.0)) * (65 / 93),
                    borderRadius: radius.reg,
                  );
                }),
            SizedBox(
              height: Common.getDinamicBottomSize(context) + space.xxl,
            ),
          ]);
        }));
  }

  Widget _buildPokemonItem(Pokemon pokemon, Orientation orientation) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PekemonDetsScreen(pokemon: pokemon)));
      },
      child: Stack(
        children: [
          AntiContainer(
            borderRadius: radius.reg,
            bgColor: (pokemon.color ?? primaryColor).withOpacity(0.65),
            paddingLeft: 70,
            width: orientation == Orientation.portrait ? (_cardWidth ?? 0.0) : (_cardWidthLandscape ?? 0.0),
            height: (orientation == Orientation.portrait ? (_cardWidth ?? 0.0) : (_cardWidthLandscape ?? 0.0)) * (65 / 93),
            alignment: Alignment.bottomRight,
            child: AntiImage(imageUrl: (pokemon.image ?? ''), width: (_cardWidth ?? 0.0), fit: BoxFit.contain, height: (_cardWidth ?? 0.0)),
          ),
          AntiContainer(
            width: orientation == Orientation.portrait ? (_cardWidth ?? 0.0) : (_cardWidthLandscape ?? 0.0),
            height: (orientation == Orientation.portrait ? (_cardWidth ?? 0.0) : (_cardWidthLandscape ?? 0.0)) * (65 / 93),
            borderRadius: radius.reg,
            paddingHorizontal: space.reg,
            paddingTop: space.lg,
            children: [
              Text(
                Common.capitalizeFirstChar(pokemon.name ?? ''),
                style: bodyBodySm.copyWith(color: primaryWhite, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return AntiAnimatedOpacity(
        type: OpacityType.FADE_IN,
        milliseconds: 400,
        isSelected: _showContent,
        child: OrientationBuilder(
          builder: (context, orientation) {
            return AntiContainer(
              isScrollable: true,
              paddingHorizontal: space.reg,
              children: [
                SizedBox(
                  height: Common.getDinamicTopSize(context) + space.xxl,
                ),
                Text('Pokebox', style: bodyH1),
                SizedBox(
                  height: space.xxl,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                      crossAxisSpacing: space.reg,
                      mainAxisSpacing: space.reg,
                      childAspectRatio: 93 / 65,
                    ),
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _pokemon.length,
                    itemBuilder: (context, index) {
                      return _buildPokemonItem(_pokemon[index], orientation);
                    }),
                SizedBox(
                  height: Common.getDinamicBottomSize(context) + space.xxl,
                ),
              ],
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    _cardWidth = (Common.getDinamicWidth(context) - (space.reg * 3)) / 2;
    _cardWidthLandscape = (Common.getDinamicWidth(context) - (space.reg * 5)) / 4;
    return Scaffold(
      body: Stack(
        children: [_buildContent(), _buildShimmer()],
      ),
    );
  }
}
