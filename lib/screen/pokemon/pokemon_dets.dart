import 'package:flutter/material.dart';
import 'package:nexus_app/core/index.dart';

class PekemonDetsScreen extends StatefulWidget {
  const PekemonDetsScreen({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  State<PekemonDetsScreen> createState() => _PekemonDetsScreenState();
}

class _PekemonDetsScreenState extends State<PekemonDetsScreen> {
  PokemonAbout? _about;
  PokemonEggGroup? _eggGroup;
  PokemonGender? _gender;
  PokemonType? _type;

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    setState(() {
      _loading = true;
    });
    Future.wait([
      PokemonRequest().getPokemon(urlPath: '/${widget.pokemon.id}/'),
      PokemonRequest().getPokemonEggGroup(urlPath: '/${widget.pokemon.id}/'),
      PokemonRequest().getPokemonGender(urlPath: '/${widget.pokemon.id}/'),
      PokemonRequest().getPokemonType(urlPath: '/${widget.pokemon.id}/'),
    ]).then((value) {
      setState(() {
        _setAbout(value[0]);
        _setEggGroup(value[1]);
        _setGender(value[2]);
        _setType(value[3]);
      });
    }).whenComplete(() {
      setState(() {
        _loading = false;
      });
    });
  }

  void _setAbout(Map<String, dynamic> data) {
    setState(() {
      _about = PokemonAbout.fromJson(data);
    });
  }

  void _setEggGroup(Map<String, dynamic> data) {
    setState(() {
      _eggGroup = PokemonEggGroup.fromJson(data);
    });
  }

  void _setGender(Map<String, dynamic> data) {
    setState(() {
      _gender = PokemonGender.fromJson(data);
    });
  }

  void _setType(Map<String, dynamic> data) {
    setState(() {
      _type = PokemonType.fromJson(data);
    });
  }

  Widget _buildAboutItem({String? title, String? value}) {
    return AntiContainer(
      width: Common.getDinamicWidth(context) * 0.6,
      flexDir: FlexDirection.ROW,
      crossAxis: CrossAxisAlignment.center,
      mainAxis: MainAxisAlignment.spaceBetween,
      marginVertical: space.sm,
      children: [
        Text(
          title ?? '',
          style: bodyCaption.copyWith(fontWeight: FontWeight.w300),
        ),
        AntiContainer(
          width: Common.getDinamicWidth(context) * 0.3,
          children: [
            Text(
              value ?? '',
              style: bodyCaption,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAbout() {
    if (_loading == true) {
      return AntiContainer(
        marginTop: space.xxl,
        child: AntiLoading(
          height: 36,
          width: 36,
          color: widget.pokemon.color ?? primaryColor,
        ),
      );
    }
    return AntiContainer(
      marginTop: space.md,
      paddingHorizontal: space.reg,
      children: [
        Text(
          'About',
          style: bodyH3,
        ),
        SizedBox(
          height: space.sm,
        ),
        _buildAboutItem(title: 'Species', value: _about?.species?.name ?? ''),
        _buildAboutItem(title: 'Height', value: _about?.height != null ? '${_about!.height} KG' : ''),
        _buildAboutItem(title: 'Wight', value: _about?.weight != null ? '${_about!.weight} CM' : ''),
        _buildAboutItem(title: 'Type', value: _about?.types?[0].type?.name ?? ''),
        (_gender?.name ?? '').isEmpty ? AntiContainer() : _buildAboutItem(title: 'Gender', value: _gender?.name ?? ''),
        (_type?.name ?? '').isEmpty ? AntiContainer() : _buildAboutItem(title: 'Type', value: _type?.name ?? ''),
        (_eggGroup?.name ?? '').isEmpty ? AntiContainer() : _buildAboutItem(title: 'Egg Group', value: _eggGroup?.name ?? ''),
        SizedBox(
          height: Common.getDinamicBottomSize(context) + space.reg,
        )
      ],
    );
  }

  Widget _buildAbilitiesCapsule(String title) {
    return AntiContainer(
      bgColor: primaryWhite.withOpacity(0.4),
      paddingHorizontal: space.reg,
      paddingVertical: space.xs,
      borderRadius: radius.full,
      marginRight: space.sm,
      child: Text(
        title,
        style: bodyCaptionSm.copyWith(color: primaryWhite),
      ),
    );
  }

  Widget _buildAbilities() {
    return AntiContainer(
      isScrollable: true,
      flexDir: FlexDirection.ROW,
      children: [
        for (int i = 0; i < (_about?.abilities ?? []).length; i++) ...[
          _buildAbilitiesCapsule(_about?.abilities?[i].ability?.name ?? ''),
        ],
      ],
    );
  }

  Widget _buildHeader() {
    return AntiContainer(
      height: 55,
      width: double.infinity,
      flexDir: FlexDirection.ROW,
      crossAxis: CrossAxisAlignment.center,
      mainAxis: MainAxisAlignment.spaceBetween,
      paddingRight: space.reg,
      children: [
        AntiContainer(
            onTap: () => Navigator.of(context).pop(),
            paddingHorizontal: space.reg,
            height: 55,
            child: Icon(Icons.arrow_back, color: primaryWhite)),
        Icon(Icons.favorite_border, color: primaryWhite),
      ],
    );
  }

  Widget _buildImage(double size, double imageSize) {
    return AntiContainer(
      marginBottom: (size * 0.1) / 4,
      child: AntiImage(imageUrl: widget.pokemon.image ?? '', width: imageSize, height: imageSize, fit: BoxFit.contain),
    );
  }

  Widget _buildBackground(double size) {
    return AntiContainer(
      height: size,
      width: double.infinity,
      bgColor: widget.pokemon.color != null ? widget.pokemon.color!.withOpacity(0.65) : primaryColor,
    );
  }

  Widget _buildHero(Orientation orientation) {
    double heroSize = orientation == Orientation.portrait ? Common.getDinamicHeight(context) * 0.5 : Common.getDinamicHeight(context);
    double imageSize = orientation == Orientation.portrait ? heroSize * 0.66 : heroSize * 0.8;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        _buildBackground(heroSize),
        AntiContainer(
          bgColor: primaryWhite,
          width: double.infinity,
          height: heroSize * 0.1,
          borderTopLeftRadius: radius.full,
          borderTopRightRadius: radius.full,
        ),
        _buildImage(heroSize, imageSize),
        AntiContainer(
          height: heroSize,
          width: double.infinity,
          children: [
            SizedBox(
              height: Common.getDinamicTopSize(context),
            ),
            _buildHeader(),
            AntiContainer(
              paddingHorizontal: space.reg,
              children: [
                AntiContainer(
                  children: [
                    Text(
                      Common.capitalizeFirstChar(widget.pokemon.name ?? ''),
                      style: bodyH1.copyWith(color: primaryWhite),
                    ),
                    SizedBox(
                      height: space.sm,
                    ),
                    _buildAbilities()
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _buildContent() {
    return OrientationBuilder(builder: (context, orientation) {
      return AntiContainer(
        isScrollable: true,
        children: [_buildHero(orientation), _buildAbout()],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
    );
  }
}
