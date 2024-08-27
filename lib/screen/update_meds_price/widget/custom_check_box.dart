part of '../update_meds_price.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.medName,
    required this.medId,
  });

  final String medName;
  final int medId;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  final updateMedsController = Get.find<UpdateMedsController>();
  bool val = false;
  // int x = 100;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: val,
      subtitle: Text(widget.medId.toString()),
      title: Text(widget.medName),
      onChanged: (value) {
        setState(() {
          val = value!;
          // x = 1000;
        });

        if (!val) {
          updateMedsController.removeID(widget.medId);
        } else {
          updateMedsController.addID(widget.medId);
        }
      },
    );
  }
}
