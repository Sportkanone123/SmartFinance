import 'package:flutter/material.dart';
import 'package:smart_finance/ui/constants.dart';

import '../components/no_animation_material_page_router.dart';

class PageEntry extends StatelessWidget {
  final String title;
  final Widget child;

  const PageEntry({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding * 1.5, kDefaultPadding, kDefaultPadding / 2),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: kDefaultPadding / 2),
            alignment: Alignment.centerLeft,
            child: Text(title, style: const TextStyle(fontSize: 20, color: Colors.black),),
          ),
          Container(
            margin: const EdgeInsets.only(top: kDefaultPadding / 2),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.white,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

class PageEntryBoldTitle extends StatelessWidget {
  final String title;
  final Widget child;

  const PageEntryBoldTitle({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding * 1.5, kDefaultPadding, kDefaultPadding / 2),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: kDefaultPadding / 2),
              alignment: Alignment.centerLeft,
              child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
            ),
            Container(
              margin: const EdgeInsets.only(top: kDefaultPadding / 2),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white,
              ),
              child: child,
            ),
          ],
        ),
    );
  }
}

class PageEntryExtendOption extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget extendWidget;

  const PageEntryExtendOption({Key? key, required this.title, required this.child, required this.extendWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding * 1.5, kDefaultPadding, kDefaultPadding / 2),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: kDefaultPadding / 2),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Expanded(child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      NoAnimationMaterialPageRoute(builder: (context) => extendWidget),
                    );
                  },
                  child: const Text("See all ▶", style: TextStyle(fontSize: 16, color: Colors.lightBlue)),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: kDefaultPadding / 2),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.white,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

class PageEntrySmallTitle extends StatelessWidget {
  final String title;
  final Widget child;

  const PageEntrySmallTitle({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding * 2, kDefaultPadding, kDefaultPadding / 2),
      child: Column(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
              alignment: Alignment.centerLeft,
              child: Text(title, style: const TextStyle(fontSize: 14, color: Color(0xFF84848A)),),
          ),
          Container(
            margin: const EdgeInsets.only(top: kDefaultPadding / 2),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.white,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}


class PageEntrySmallTitleExtendOption extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget extendWidget;

  const PageEntrySmallTitleExtendOption({Key? key, required this.title, required this.child, required this.extendWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding * 2, kDefaultPadding, kDefaultPadding / 2),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Expanded(child: Text(title, style: const TextStyle(fontSize: 14, color: Color(0xFF84848A)))),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      NoAnimationMaterialPageRoute(builder: (context) => extendWidget),
                    );
                  },
                  child: const Text("See all ▶", style: TextStyle(fontSize: 16, color: Colors.lightBlue)),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: kDefaultPadding / 2),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.white,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}


class PageEntryWithBalance extends StatelessWidget {
  final String title;
  final double balance;
  final Widget child;

  const PageEntryWithBalance({Key? key, required this.title, required this.balance, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding * 2, kDefaultPadding, kDefaultPadding / 2),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, color: Color(0xFF84848A)),),
                Text("$balance €", style: const TextStyle(fontSize: 14, color: Color(0xFF84848A)),),
              ],
            )
          ),
          Container(
            margin: const EdgeInsets.only(top: kDefaultPadding / 2),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.white,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

