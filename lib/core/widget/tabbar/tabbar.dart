import 'package:flutter/material.dart';
import 'package:nexus_app/core/index.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AntiTabbar extends StatefulWidget {
  const AntiTabbar(
      {super.key,
      required this.tabbarItems,
      required this.tabbarViews,
      this.type = TabbarType.DEFAULT,
      this.itemWidth,
      this.hasPaddingTop = false,
      this.hasScrollEffect = false,
      this.isStack = false,
      this.initialPage,
      this.onSwipe,
      this.onTapTabItem});
  final List<TabbarItem> tabbarItems;
  final List<Widget> tabbarViews;
  final TabbarType? type;
  final double? itemWidth;
  final bool hasPaddingTop;
  final bool hasScrollEffect;
  final bool isStack;
  final int? initialPage;
  final void Function(int value)? onSwipe;
  final void Function(int value)? onTapTabItem;

  @override
  State<AntiTabbar> createState() => _AntiTabbarState();
}

class _AntiTabbarState extends State<AntiTabbar> {
  int _current = 0;
  late PreloadPageController _pageController;
  final ItemScrollController _itemScrollController = ItemScrollController();

  @override
  void initState() {
    if (widget.type == TabbarType.CAPSULE_GROUP && widget.itemWidth == null) {
      throw ArgumentError('itemWidth must be provided when type is CAPSULE_GROUP');
    }
    super.initState();
    setState(() {
      _current = widget.initialPage ?? 0;
    });
    _pageController = PreloadPageController(initialPage: widget.initialPage ?? 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _scrollToIndex(int index) {
    if (widget.hasScrollEffect) {
      _itemScrollController.scrollTo(
        index: index,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
  }

  Widget _buildTabbarView() {
    if (widget.tabbarViews.isEmpty) return SizedBox();
    if (widget.isStack == true) {
      return Flexible(
        child: ProsteIndexedStack(index: _current, children: [
          for (int i = 0; i < widget.tabbarViews.length; i++) ...[
            IndexedStackChild(
              child: widget.tabbarViews[i],
            ),
          ],
        ]),
      );
    }

    return Flexible(
      child: PreloadPageView.builder(
        preloadPagesCount: widget.tabbarViews.length,
        controller: _pageController,
        itemBuilder: (context, position) {
          return widget.tabbarViews[position];
        },
        itemCount: widget.tabbarViews.length,
        onPageChanged: (value) {
          if (widget.onSwipe != null) {
            widget.onSwipe!(value);
          }
          _scrollToIndex(value);
          setState(() {
            _current = value;
          });
        },
      ),
    );
  }

  Widget _buildCapsuleGroup() {
    return AntiContainer(
      height: 34,
      width: double.infinity,
      child: ScrollablePositionedList.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: ClampingScrollPhysics(),
          itemScrollController: _itemScrollController,
          itemCount: widget.tabbarItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return AntiContainer(
              onTap: () {
                if (widget.onTapTabItem != null) {
                  widget.onTapTabItem!(index);
                }
                _scrollToIndex(index);
                if (widget.isStack == false) {
                  _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                }
                setState(() {
                  _current = index;
                });
              },
              child: Stack(children: [
                AntiContainer(
                  borderColor: secondaryGold,
                  borderTopWidth: 1,
                  borderBottomWidth: 1,
                  borderLeftWidth: index == 0 ? 1.0 : 0.0,
                  borderRightWidth: index == widget.tabbarItems.length - 1 ? 1.0 : 0.0,
                  borderTopLeftRadius: index == 0 ? radius.full : 0.0,
                  borderBottomLeftRadius: index == 0 ? radius.full : 0.0,
                  borderTopRightRadius: index == widget.tabbarItems.length - 1 ? radius.full : 0.0,
                  borderBottomRightRadius: index == widget.tabbarItems.length - 1 ? radius.full : 0.0,
                  marginLeft: index == 0 ? space.reg : 0.0,
                  marginRight: index == widget.tabbarItems.length - 1 ? space.reg : 0.0,
                  width: widget.itemWidth,
                  height: 34,
                ),
                AntiContainer(
                  marginLeft: index == 0 ? space.reg : 0.0,
                  marginRight: index == widget.tabbarItems.length - 1 ? space.reg : 0.0,
                  child: AnimatedContainer(
                    height: 34,
                    width: widget.itemWidth,
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(horizontal: space.md),
                    decoration: BoxDecoration(
                      color: _current == index ? primaryColor : null,
                      borderRadius: BorderRadius.circular(radius.full),
                    ),
                    child: AntiContainer(
                      mainAxis: MainAxisAlignment.center,
                      crossAxis: CrossAxisAlignment.center,
                      flexDir: FlexDirection.ROW,
                      children: [
                        widget.itemWidth != null
                            ? Flexible(
                                child: Text(
                                  (widget.tabbarItems[index].name ?? ''),
                                  style: bodyCaption.copyWith(
                                      color: _current == index ? primaryWhite : primaryColor, fontWeight: FontWeight.w700),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            : Text(
                                (widget.tabbarItems[index].name ?? ''),
                                style: bodyCaption.copyWith(
                                    color: _current == index ? primaryWhite : primaryColor, fontWeight: FontWeight.w700),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                        Visibility(
                          visible: widget.tabbarItems[index].hasNotif == true && _current != index,
                          child: AntiContainer(
                            width: space.xs,
                            height: space.xs,
                            marginLeft: 8,
                            bgColor: secondaryGold,
                            borderRadius: radius.full,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            );
          }),
    );
  }

  Widget _buildCapsule() {
    return AntiContainer(
      height: 30,
      width: double.infinity,
      marginBottom: widget.hasPaddingTop ? space.reg : 0,
      child: ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        physics: ClampingScrollPhysics(),
        itemCount: widget.tabbarItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return AntiContainer(
            onTap: () {
              if (widget.onTapTabItem != null) {
                widget.onTapTabItem!(index);
              }
              _scrollToIndex(index);
              if (widget.isStack == false) {
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
              }
              setState(() {
                _current = index;
              });
            },
            marginLeft: index == 0 ? space.reg : 0.0,
            marginRight: index == widget.tabbarItems.length - 1 ? space.reg : space.sm,
            child: AnimatedContainer(
              width: widget.itemWidth,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
              padding: EdgeInsets.symmetric(horizontal: space.md),
              decoration: BoxDecoration(
                  color: _current == index ? primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(radius.full),
                  border: Border.all(color: _current == index ? Colors.transparent : primaryColor, width: 1)),
              child: AntiContainer(
                mainAxis: MainAxisAlignment.center,
                crossAxis: CrossAxisAlignment.center,
                flexDir: FlexDirection.ROW,
                children: [
                  widget.itemWidth != null
                      ? Flexible(
                          child: Text(
                            (widget.tabbarItems[index].name ?? ''),
                            style:
                                bodyCaption.copyWith(color: _current == index ? primaryWhite : primaryColor, fontWeight: FontWeight.w500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : Text(
                          (widget.tabbarItems[index].name ?? ''),
                          style: bodyCaption.copyWith(color: _current == index ? primaryWhite : primaryColor, fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                  Visibility(
                    visible: widget.tabbarItems[index].hasNotif == true && _current != index,
                    child: AntiContainer(
                      width: space.xs,
                      height: space.xs,
                      marginLeft: 8,
                      bgColor: secondaryGold,
                      borderRadius: radius.full,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDefault() {
    return AntiContainer(
      height: 46,
      width: double.infinity,
      marginBottom: widget.hasPaddingTop ? space.reg : 0,
      child: ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        physics: ClampingScrollPhysics(),
        itemCount: widget.tabbarItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return AntiContainer(
            onTap: () {
              if (widget.onTapTabItem != null) {
                widget.onTapTabItem!(index);
              }
              _scrollToIndex(index);
              if (widget.isStack == false) {
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
              }
              setState(() {
                _current = index;
              });
            },
            child: AnimatedContainer(
              width: widget.itemWidth,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _current == index ? secondaryGold : primaryColor.withOpacity(0.3),
                    width: 4,
                  ),
                ),
              ),
              child: AntiContainer(
                mainAxis: MainAxisAlignment.center,
                crossAxis: CrossAxisAlignment.center,
                flexDir: FlexDirection.ROW,
                children: [
                  widget.itemWidth != null
                      ? Flexible(
                          child: Text(
                            (widget.tabbarItems[index].name ?? ''),
                            style: bodyCaption.copyWith(color: _current == index ? primaryColor : primaryGrey, fontWeight: FontWeight.w500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : Text(
                          (widget.tabbarItems[index].name ?? ''),
                          style: bodyCaption.copyWith(color: _current == index ? primaryColor : primaryGrey, fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                  Visibility(
                    visible: widget.tabbarItems[index].hasNotif == true && _current != index,
                    child: AntiContainer(
                      width: space.xs,
                      height: space.xs,
                      marginLeft: 8,
                      bgColor: secondaryGold,
                      borderRadius: radius.full,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabbarItem() {
    if (widget.tabbarItems.isEmpty) return SizedBox();
    if (widget.type == TabbarType.CAPSULE_GROUP) {
      return _buildCapsuleGroup();
    } else if (widget.type == TabbarType.CAPSULE) {
      return _buildCapsule();
    } else {
      return _buildDefault();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AntiContainer(
        children: [_buildTabbarItem(), _buildTabbarView()],
      ),
    );
  }
}
