import 'package:flutter/material.dart';
import 'package:flutter_ui_desing_demo/custom/BorderBox.dart';
import 'package:flutter_ui_desing_demo/custom/OptionButton.dart';
import 'package:flutter_ui_desing_demo/utils/constants.dart';
import 'package:flutter_ui_desing_demo/utils/custom_functions.dart';
import 'package:flutter_ui_desing_demo/utils/widget_functions.dart';

import '../utils/sample_data.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(children: [
          Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BorderBox(50, 50,
                        child: Icon(
                          Icons.menu,
                          color: COLOR_BLACK,
                        )),
                    BorderBox(50, 50,
                        child: Icon(
                          Icons.settings,
                          color: COLOR_BLACK,
                        ))
                  ],
                ),
              ),
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Text(
                  "City",
                  style: themeData.textTheme.bodyText2,
                ),
              ),
              addVerticalSpace(10),
              Padding(
                padding: sidePadding,
                child: Text(
                  "San Francisco",
                  style: themeData.textTheme.headline1,
                ),
              ),
              Padding(
                  padding: sidePadding,
                  child: Divider(
                    height: padding,
                    color: COLOR_GREY,
                  )),
              addVerticalSpace(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: ["<\220,000", "For Sale", "3-4 Beds", ">1000 sqft"]
                      .map((filter) => ChiceOption(text: filter))
                      .toList(),
                ),
              ),
              addVerticalSpace(10),
              Expanded(
                child: Padding(
                  padding: sidePadding,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                      itemCount: RE_DATA.length,
                      itemBuilder: (context, index) {
                        return RealEstateItem(itemData: RE_DATA[index]);
                      }),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 20,
              width: size.width,
              child: Center(
                child: OptionButton(
                    text: "Map View", icon: Icons.map, width: size.width*0.35),
              ))
        ]),
      ),
    ));
  }
}

class ChiceOption extends StatelessWidget {
  final String text;

  const ChiceOption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: COLOR_GREY.withAlpha(25)),
      margin: const EdgeInsets.only(left: 25),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              children: [
                Image.asset(itemData["image"]),
                Positioned(
                    top: 15,
                    right: 15,
                    child: BorderBox(50, 50,
                        child: Icon(
                          Icons.favorite,
                          color: COLOR_GREY,
                        )))
              ],
            ),
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text(
                "${formatCurrency(itemData["amount"], locale: itemData["currency"]["locale"], name: itemData["currency"]["name"])}",
                style: themeData.textTheme.headline1,
              ),
              addHorizontalSpace(10),
              Text(
                "${itemData["address"]}",
                style: themeData.textTheme.bodyText2,
              )
            ],
          ),
          addVerticalSpace(10),
          Text(
            "${itemData["bedroom"]} bedroom / ${itemData["bathroom"]} bathroom / ${itemData["area"]} area",
            style: themeData.textTheme.headline5,
          )
        ],
      ),
    );
  }
}
