import 'package:flutter/material.dart';
import './../../store/type/type.dart';

///这个页面是作为整个APP的最外层的容器，以Tab为基础控制每个item的显示与隐藏
class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _Item {
  String name;
  Icon activeIcon, normalIcon;
  _Item(this.name, this.activeIcon, this.normalIcon);
}

class _App extends State<App> {
  final Type store = Type();

  List<Widget> _pageList;
  final itemNames = [
    _Item(
      '热映',
      Icon(Icons.flight_takeoff),
      Icon(Icons.flight_land),
    ),
    _Item(
      '找片',
      Icon(Icons.child_care),
      Icon(Icons.face),
    ),
    _Item(
      '我的',
      Icon(Icons.person_add),
      Icon(Icons.person),
    ),
    _Item(
      '热映',
      Icon(Icons.flight_takeoff),
      Icon(Icons.flight_land),
    ),
    _Item(
      '找片',
      Icon(Icons.child_care),
      Icon(Icons.face),
    ),
    _Item(
      '我的',
      Icon(Icons.person_add),
      Icon(Icons.person),
    ),
    _Item(
      '热映',
      Icon(Icons.flight_takeoff),
      Icon(Icons.flight_land),
    ),
    _Item(
      '找片',
      Icon(Icons.child_care),
      Icon(Icons.face),
    ),
    _Item(
      '我的',
      Icon(Icons.person_add),
      Icon(Icons.person),
    ),
  ];

  List<BottomNavigationBarItem> itemList;

  @override
  void initState() {
    super.initState();
    store.fetchData();
    if (_pageList == null) {
      _pageList = [
        Text('热映', textDirection: TextDirection.ltr),
        Text('找片', textDirection: TextDirection.ltr),
        Text('我的', textDirection: TextDirection.ltr)
      ];
    }
    if (itemList == null) {
      itemList = itemNames
          .map((item) => BottomNavigationBarItem(
              icon: item.normalIcon,
              title: Text(
                item.name,
                style: TextStyle(fontSize: 10),
              ),
              activeIcon: item.activeIcon
              //Image.asset(item.activeIcon, width: 30.0, height: 30.0)))
              ))
          .toList();
    }
  }

  int _selectIndex = 0;

  @override
  void didUpdateWidget(App oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectIndex,
        children: _pageList,
      ), // https://www.jianshu.com/p/86d29a939624
      bottomNavigationBar: BottomNavigationBar(
          items: itemList,
          onTap: (int index) {
            ///这里根据点击的index来显示，非index的page均隐藏
            setState(() {
              _selectIndex = index;
              //这个是用来控制比较特别的shopPage中WebView不能动态隐藏的问题
              //shopPageWidget.setShowState(
              //    _pageList.indexOf(shopPageWidget) == _selectIndex);
            });
          },
          //图标大小
          iconSize: 24,
          //当前选中的索引
          currentIndex: _selectIndex,
          //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
          fixedColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10,
          unselectedFontSize: 10),
    );
  }
}