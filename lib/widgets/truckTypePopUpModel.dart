
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Liveasy/models/providerData.dart';
Color color_Unselected = Colors.white;
Color color_Selected = Colors.black45;
Color color_1 = color_Unselected;
Color color_2 = color_Unselected;
Color color_3 = color_Unselected;
Color color_4 = color_Unselected;
Color color_5 = color_Unselected;
Color color_6 = color_Unselected;
class TruckTypeWidgetScreen extends StatefulWidget {
  void clearAll(){
    color_1 = color_Unselected;
    color_2 = color_Unselected;
    color_3 = color_Unselected;
    color_4 = color_Unselected;
    color_5 = color_Unselected;
    color_6 = color_Unselected;
  }
  @override
  _TruckTypeWidgetScreenState createState() => _TruckTypeWidgetScreenState();
}
class _TruckTypeWidgetScreenState extends State<TruckTypeWidgetScreen> {
  void invertAllColour(int cardNumber) {
    if (cardNumber == 1 && color_1 == color_Unselected) {
      color_1 = color_Selected;
      color_2 = color_Unselected;
      color_3 = color_Unselected;
      color_4 = color_Unselected;
      color_5 = color_Unselected;
      color_6 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateTruckPreference(newValue: 'Container');
    } else if (cardNumber == 2 && color_2 == color_Unselected) {
      color_2 = color_Selected;
      color_1 = color_Unselected;
      color_3 = color_Unselected;
      color_4 = color_Unselected;
      color_5 = color_Unselected;
      color_6 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateTruckPreference(newValue: 'Hyva');
    } else if (cardNumber == 3 && color_3 == color_Unselected) {
      color_3 = color_Selected;
      color_2 = color_Unselected;
      color_1 = color_Unselected;
      color_4 = color_Unselected;
      color_5 = color_Unselected;
      color_6 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateTruckPreference(newValue: 'LCV');
    }
    else if (cardNumber == 4 && color_4 == color_Unselected) {
      color_4 = color_Selected;
      color_2 = color_Unselected;
      color_3 = color_Unselected;
      color_1 = color_Unselected;
      color_5 = color_Unselected;
      color_6 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateTruckPreference(newValue: 'Tanker');
    }
    else if (cardNumber == 5 && color_5 == color_Unselected) {
      color_5 = color_Selected;
      color_2 = color_Unselected;
      color_3 = color_Unselected;
      color_4 = color_Unselected;
      color_1 = color_Unselected;
      color_6 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateTruckPreference(newValue: 'Trailer');
    }
    else if (cardNumber == 6 && color_6 == color_Unselected) {
      color_6 = color_Selected;
      color_2 = color_Unselected;
      color_3 = color_Unselected;
      color_4 = color_Unselected;
      color_5 = color_Unselected;
      color_1 = color_Unselected;
      Provider.of<ProviderData>(context, listen: false)
          .updateTruckPreference(newValue: 'Truck');
    }}
    @override
    Widget build(BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3 ),
        insetPadding:  EdgeInsets.only(left: 0, right: 0, ),
        content:  SingleChildScrollView(
          child: ListBody(
                children: [
                  Container(
                    height: 50,
                    child: Center(
                      child: Text('Select Truck Type'),
                    ),
                    color: Color(0xFFF3F2F1),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTruckCard(context: context,cardName: 'Container',cardImage: 'container',cardNumber: 1 ,cardColor: color_1),
                        buildTruckCard(context: context,cardName: 'Hyva',cardImage: 'hyva',cardNumber: 2 ,cardColor: color_2),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTruckCard(context: context,cardName: 'LCV',cardImage: 'lcv',cardNumber: 3 ,cardColor: color_3),
                        buildTruckCard(context: context,cardName: 'Tanker',cardImage: 'tanker',cardNumber: 4 ,cardColor: color_4),

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTruckCard(context: context,cardName: 'Trailer',cardImage: 'trailer',cardNumber: 5 ,cardColor: color_5),
                        buildTruckCard(context: context,cardName: 'Truck',cardImage: 'truck',cardNumber: 6 ,cardColor: color_6),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      );
    }

    GestureDetector buildTruckCard({BuildContext context, String cardName, String cardImage, int cardNumber, Color cardColor}) {
      return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        invertAllColour(cardNumber);
                      });
                    },
                    child: Container(
                      color: cardColor,
                      height: 120,
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/$cardImage.jpeg'),
                              ),
                            ),
                          ),
                          Text(
                            '$cardName',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
    }
  }