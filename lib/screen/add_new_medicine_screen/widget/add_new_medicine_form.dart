part of '../add_new_medicine.dart';

class AddNewMedicineForm extends StatefulWidget {
  const AddNewMedicineForm({
    super.key,
    required this.formKey,
    required this.medicineNameTextEditingController,
    required this.pharmaceuticalCompositionTEController,
    required this.companyTextEditingController,
    required this.pharmaceuticalIndicationTEController,
    required this.priceTextEditingController,
    required this.quantityTextEditingController,
    required this.lowBoundTextEditingController,
    this.onTap,
    this.uploadImgFunc,
    required this.medicineCodeTextEditingController,
    required this.pharmaceuticalTiter,
  });

  final TextEditingController medicineNameTextEditingController;
  final TextEditingController pharmaceuticalCompositionTEController;
  final TextEditingController companyTextEditingController;
  final TextEditingController pharmaceuticalIndicationTEController;
  final TextEditingController priceTextEditingController;
  final TextEditingController quantityTextEditingController;
  final TextEditingController lowBoundTextEditingController;
  final TextEditingController medicineCodeTextEditingController;
  final TextEditingController pharmaceuticalTiter;
  final GlobalKey<FormState> formKey;
  final void Function()? onTap;
  final void Function()? uploadImgFunc;

  @override
  State<AddNewMedicineForm> createState() => _AddNewMedicineFormState();
}

class _AddNewMedicineFormState extends State<AddNewMedicineForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormFieldWithTitle(
            title: "Enter The name of medicine",
            hintText: "Medicine name",
            controller: widget.medicineNameTextEditingController,
          ),
          TextFormFieldWithTitle(
            title: "Enter The pharmaceutical composition of medicine",
            hintText: "pharmaceutical composition",
            controller: widget.pharmaceuticalCompositionTEController,
            minLines: 2,
          ),
          TextFormFieldWithTitle(
            title: "Choose company name",
            hintText: "Company name",
            controller: widget.companyTextEditingController,
          ),
          TextFormFieldWithTitle(
            title: "Enter the pharmaceutical indication",
            hintText: "pharmaceutical indication",
            controller: widget.pharmaceuticalIndicationTEController,
            minLines: 3,
          ),
          TextFormFieldWithTitle(
            title: "Enter the Medicine price",
            hintText: "price",
            controller: widget.priceTextEditingController,
            keyboardType: TextInputType.number,
          ),
          TextFormFieldWithTitle(
            title: "Enter the Medicine quantity",
            hintText: "Quantity",
            controller: widget.quantityTextEditingController,
            keyboardType: TextInputType.number,
          ),
          TextFormFieldWithTitle(
            title: "Enter the Medicine low bound",
            hintText: "Low Bound",
            controller: widget.lowBoundTextEditingController,
            keyboardType: TextInputType.number,
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: TextFormFieldWithTitle(
                  title: "Enter the Medicine Code",
                  hintText: "medicine code",
                  controller: widget.lowBoundTextEditingController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  var res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SimpleBarcodeScannerPage(),
                      ));
                  setState(() {
                    if (res is String) {
                      widget.medicineCodeTextEditingController.text = res;
                    }
                  });
                },
                child: const Text('Open Scanner'),
              ),
            ],
          ),
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: UploadPhoto(
                onTap: widget.uploadImgFunc,
              )),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            title: "Submit",
            onTap: widget.onTap,
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
