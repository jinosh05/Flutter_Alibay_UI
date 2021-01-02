child: Row(
                children: [
                  Stack(
                    children: [
                      Transform.rotate(
                        angle: 270 * pi / 180,
                        child:Image.asset("assets/bookmark.png",
                      width: 300,
                      height: 100,)
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              
                              Text(
                                "-22%",
                                style: TextStyle(
                                    fontSize: 16,
                               
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                            
                              Text(
                                "First Month",
                                style: TextStyle(
                                    fontSize: 16,
                                
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),




              Card(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/1.jpg"), fit: BoxFit.cover)),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Positioned(
                            right: 0,
                            child: Transform.rotate(
                                angle: 270 * pi / 180,
                                child: Image.asset(
                                  'assets/bookmark.png',
                                  height: 70,
                                  width: 220,
                                )),
                          ),
                          Positioned(
                            child: Text(
                              "-22%",
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            right: 20,
                            top: 12,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )