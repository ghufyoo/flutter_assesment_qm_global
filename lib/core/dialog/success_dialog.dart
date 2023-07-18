import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: Get.width * 0.9,
                constraints: BoxConstraints(minHeight: Get.height * 0.35),
                color: Colors.white,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Success',
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w800),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => Get.close(1),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check_circle_outline_outlined,
                                size: 100,
                                color: Colors.greenAccent.shade700,
                              ),
                              SizedBox(height: constraints.minHeight * 0.08),
                              Text(
                                message,
                                textAlign: TextAlign.center,
                                style:
                                    GoogleFonts.openSans(color: Colors.black45),
                              )
                         
                            ],
                          ),
                          SizedBox(height: constraints.minHeight * 0.01),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Get.back();
                                    
                                  },
                                  child: SizedBox(
                                      height: 55,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          "Okay",
                                        )),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
