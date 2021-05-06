import 'package:flutter/material.dart';
import 'package:flutter_blueprint/app/modules/product/view/local_widget/info_container.dart';
import 'package:flutter_blueprint/app/theme/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [_stackImage(), _productDetails(), _backArrow()],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _stackImage() => Container(
        width: Dimens.screenWidth,
        height: Dimens.hundred * 3.5,
        decoration: BoxDecoration(
            color: ColorsValue.lightPink,
            image:
                DecorationImage(image: AssetImage('assets/img/pug_image.png'))),
      );
  Widget _productDetails() => SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: Dimens.screenWidth,
              height: Dimens.hundred * 3,
            ),
            Container(
              width: Dimens.screenWidth,
              height: Dimens.screenHeight,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pug Dog',
                          style: Styles.boldBlack26,
                        ),
                        Text(
                          '₹200   ',
                          style: Styles.boldWhite23
                              .copyWith(color: ColorsValue.primaryColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimens.fifteen,
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy',
                      style: Styles.blackBold15,
                    ),
                    SizedBox(
                      height: Dimens.five,
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: EdgeInsets.only(right: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: ColorsValue.primaryColor,
                        size: 10,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(
                      height: Dimens.thirty,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            5,
                            (index) => Info(
                                  title: 'Age',
                                  value: '1',
                                )),
                      ),
                    ),
                    SizedBox(
                      height: Dimens.twenty,
                    ),
                    ownerDetail()
                  ],
                ),
              ),
            )
          ],
        ),
      );
  Widget ownerDetail() => Container(
        height: 120,
        width: Dimens.screenWidth,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Container(
                margin: EdgeInsets.only(right: 0),
                width: Dimens.screenWidth - 60,
                height: 120,
                decoration: BoxDecoration(
                    color: ColorsValue.lightPink,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.only(left:60.0,right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Alixa Drona'),
                          Text('Owner')
                        ],
                      ),
                      Text('1.68 KM')
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
                top: 20,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsValue.primaryColor,width: 0.1),
                    image: DecorationImage(
                      image: AssetImage('assets/img/owner.jpg'),
                      fit: BoxFit.cover
                    ),
                      shape: BoxShape.circle
                  ),
            ))
          ],
        ),
      );
  Widget _backArrow() => Positioned(
      top: 10,
      left: 10,
      child: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined), onPressed: () {}));
}
