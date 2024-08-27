
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/widgets/button/custom_ink_well.dart';
import 'package:pharmachy_app/core/widgets/images/general_image_assets.dart';
import 'package:pharmachy_app/core/widgets/images/general_network_image.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/core/widgets/text/custom_text_from_field.dart';
import 'package:pharmachy_app/model/medicine_model.dart';
import 'package:pharmachy_app/screen/client_home_screen/controller/client_home_screen_controller.dart';
import 'package:pharmachy_app/screen/client_main_page/controller/navigation_controller.dart';
import 'package:pharmachy_app/screen/common_widgets/grid_screen.dart';
import 'package:pharmachy_app/screen/medicine_details_screen/medicine_details.dart';
import 'package:pharmachy_app/screen/notifications_screen.dart/notifications_s.dart';

import '../../res.dart';
part "client_home_screen.dart";
part 'widget/search_app_bar.dart';
part 'widget/medicine_card.dart';