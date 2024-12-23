import 'package:flutter/material.dart';
import 'package:islami_app/home/taps/radio/reciters_list_widget.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

import 'radio_list_widget.dart';

class RadioScreen extends StatefulWidget {
  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int selectedButton = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          right: width * 0.03, left: width * 0.03, top: height * 0.03),
      child: Column(
        children: [
          Image.asset('assets/images/islami_logo.png'),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.transperntBlack,
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                      onTap: () {
                        selectedButton = 0;
                        setState(() {});
                      },
                      child: selectedButton == 0
                          ? Container(
                              decoration: BoxDecoration(
                                  color: AppColors.primaryDark,
                                  borderRadius: BorderRadius.circular(12)),
                              alignment: Alignment.center,
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.01),
                              child: Text(
                                'Radio',
                                style: AppStyles.bold16Black,
                              ),
                            )
                          : Text(
                              'Radio',
                              textAlign: TextAlign.center,
                              style: AppStyles.bold16White,
                            )),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      selectedButton = 1;
                      setState(() {});
                    },
                    child: selectedButton == 1
                        ? Container(
                            decoration: BoxDecoration(
                                color: AppColors.primaryDark,
                                borderRadius: BorderRadius.circular(12)),
                            alignment: Alignment.center,
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.01),
                            child: Text(
                              'Reciters',
                              style: AppStyles.bold16Black,
                            ))
                        : Text(
                            'Reciters',
                            style: AppStyles.bold16White,
                            textAlign: TextAlign.center,
                          ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              itemCount: 10,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: height * 0.02,
                );
              },
              itemBuilder: (context, index) {
                return selectedButton == 0
                    ? RadioListWidget(
                        height: height,
                        width: width,
                      )
                    : RecitersListWidget(height: height, width: width);
              },
            ),
          )
        ],
      ),
    );
  }
}
