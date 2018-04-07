import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Yang Chen Fu',
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: new MyHomePage(title: '10 Important Principles'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  Map<String, String> principles = new Map();

  String _principle = "";
  String _exposition = "";
  int _offset = 0;

  AppLifecycleState _notification;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      updatePrinciple();
    }
  }

  void incrementOffset() {
    _offset += 1;
    updatePrinciple();
  }

  void updatePrinciple() {
    DateTime d = new DateTime.now();
    int hash = (d.day * 127 + d.month * 13 + 11 + _offset) % 10;

    if (_principle != principles.keys.elementAt(hash)) {
      setState(() {
        _principle = principles.keys.elementAt(hash);
        _exposition = principles[_principle];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    principles["Elevate the Crown and lift the Spirit"] = '''
        Emptying the thoughts and raising the head as if the crown of the head is pushing up against the heavens. 
        
        The neck must be straightened to allow the head to be raised. 
        
        This allows the shen and qi to arrive at the crown of the head. 
        
        Do not use li or the neck will be stiff and qi and blood circulation will be hindered. 
        
        One must have natural intention of emptiness in the mind
        ''';
    principles["Contain the chest, expand the back"] = '''
        When you depress the chest naturally qi will sink down to the Dan tian. 
        
        If you expand the chest then qi will raise to the chest causing top heaviness and one will float. 
        
        To expand the back is to allow the qi to adhere to the back. If one sinks the chest and you will be able to expand the back naturally.  
        
        Then one can project qi from the spine.
        ''';
    principles["Song the waist"] = '''
        The waist is the commander of the body. When one is able to song the waist qi will increase in the legs and thus provide a stable base for firm rooting. 
        
        Changes of movement from xu to shi and vice versa are derived from movement of the waist. 
        
        There is a saying that the source of qi is from the waist, therefore if one lacks strength, one should pay more attention to the waist and the lower limbs.
        ''';
    principles["Differentiate between xu and shi"] = '''
        When ones weight is on the right, the right leg becomes shi and the left leg xu, or vice versa.   
        
        When one is able to distinguish xu shi, one is able to turn and move with lightness and effortlessness. 
        
        If not, steps will be sluggish and heavy, and ones movements can be easily influenced by others.
        ''';
    principles["Sink the shoulders and weighting down the elbows"] = '''
        Sinking the shoulders is to let the shoulders be song and drop downwards. 
        
        If not both shoulders will rise causing qi to rise in them. No strength can be exerted from the body if this happens. 
        
        Weighting down the elbow is to direct the elbows downward and be song. 
        
        If the elbows rise up, the shoulders will have great difficulty in sinking, thus affecting the strength of your internal power, and you will not be able to throw your opponent away.  This is similar to what is known as ‘stifling the power’ in external martial arts.
        ''';
    principles["Use Yi and not Li"] = '''
        For practitioners of Taiji Quan the whole body must be song so that no li remains within the sinews and bones to restrict ones’s power.  
        
        Only then will one be light and flexible, and move accordingly. 
        
        One might doubt how one could develop such power without using li.  It is because the human body contains jing luo, which enable the flow of qi.  
        
        When li is used, this will cause the blockage of qi in these jing luo and result in sluggish movements.  
        
        Any movement in a small part of the body will affect the whole body.  Using the yi, qi will flow to where it is directed.  It also helps the flow of blood and qi circulation and strengthens the body.
        ''';
    principles["Coordinate the upper body with the lower body"] = '''
        In Taiji theory, movement should be rooted in the feet, stabilized through the legs, commanded by the waist and expressed through the hands. 
        
        When the movement of the feet, legs, waist and hands are in unison then intention will follow in the eyes. 
        
        This is regarded as the complete coordination of above and below. If one of these is missing the movement becomes fragmented.
        ''';
    principles["Internal and external coordinate"] = '''
        As you move, the external body coordinates as you relax (fang song) the shoulders into the hips, the elbows into the knees and the hands into the feet.
        
        Relaxing into the movements sends the energy and blood (QiXue) out to the limbs, now the whole body is nourished, regulating blood pressure, relaxing the soft tissues and veins/arteries and calming the entire nervous system.
        
        The mind and body are now working together through the 6 harmony’s as we practice our form.  The Tai Chi Classics say the body moves as one unit, however in applying these 6 harmony’s  we can see that although the body moves as one unit, it does not all move at the same time
        ''';
    principles["Continuity without breakage"] = '''
        In external martial arts, the power used is only physical strength and therefore there is a start and a finish to it. In between is the break where strength from the previous move is finished and before the new force is issued, which is the weakest point and can be easily exploited by the opponent. 
        
        Taiji Quan uses yi and not li, hence the movements become continuous without ending like a roaring river without ceasing. When in circulation, the qi is described as like drawing silk from a cocoon, to signify continuous flow of movement.
        ''';
    principles["Seeking stillness within movement"] = '''
        In external martial arts, power is generated by jumping, punching and kicking as hard as possible. 
        
        Hence after prolonged practice, one is panting for breath and the blood vessels are enlarged. By contrast Taiji Quan emphasizes stillness over movement. Even though in motion, the form appears tranquil. 
        
        Therefore when practicing, the slower the better, with long deep breathing, to allow the qi to sink to the Dan tian and thus prevent one from over exerting oneself physically.
        ''';

    updatePrinciple();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _showModal(BuildContext context, String title, String text) {
    MarkdownStyleSheet ss = MarkdownStyleSheet
        .largeFromTheme(Theme.of(context))
        .copyWith(
            code: new TextStyle(
                inherit: false,
                fontSize: 18.0,
                color: Theme.of(context).accentColor));

    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
              child: new Markdown(
            padding: const EdgeInsets.all(32.0),
            data: '#### ' +
                title +
                '''


            ''' +
                text,
            styleSheet: ss,
          ));
        });
  }

  Drawer _buildDrawer(BuildContext context) {
    List icons = <Widget>[
      new Icon(Icons.filter_1),
      new Icon(Icons.filter_2),
      new Icon(Icons.filter_3),
      new Icon(Icons.filter_4),
      new Icon(Icons.filter_5),
      new Icon(Icons.filter_6),
      new Icon(Icons.filter_7),
      new Icon(Icons.filter_8),
      new Icon(Icons.filter_9),
      new Icon(Icons.filter)
    ];
    List items = new List<Widget>();
    items.add(new DrawerHeader(
        child: new Center(
            child: new Text(
      'Principles',
      style: new TextStyle(
        inherit: true,
        color: Theme.of(context).accentColor,
        fontSize: 24.0,
      ),
    ))));
    for (var i = 0; i < 10; i++) {
      var p = principles.keys.toList()[i];
      var exp = principles.values.toList()[i];
      items.add(
        new ListTile(
          leading: icons[i],
          title: new Text(p),
          onTap: () {
            Navigator.of(context).pop();
            _showModal(context, p, exp);
          },
        ),
      );
    }
    ;
    return new Drawer(
        child: new ListView(
      children: items,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      drawer: _buildDrawer(context),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("assets/wuchienchuan.jpg"),
                  fit: BoxFit.cover,
                  alignment: AlignmentDirectional.topCenter,
                  colorFilter: new ColorFilter.mode(
                      Colors.black54.withOpacity(0.5), BlendMode.luminosity)),
            ),
          ),
          new Align(
            alignment: AlignmentDirectional.topCenter,
            child: new Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Expanded(
                    child: new FlatButton(
                      onPressed: () {
                        _showModal(context, _principle, _exposition);
                      },
                      child: new Text(
                        _principle,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          inherit: true,
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
