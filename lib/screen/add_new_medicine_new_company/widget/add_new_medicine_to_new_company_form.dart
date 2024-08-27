part of '../add_new_medicine_new_company.dart';

class AddNewMedicineToNewCompanyForm extends StatelessWidget {
  const AddNewMedicineToNewCompanyForm({
    super.key,
    required this.formKey,
    required this.medicineNameTextEditingController,
    required this.pharmaceuticalCompositionTEController,
    required this.companyTextEditingController,
    required this.pharmaceuticalIndicationTEController,
    required this.priceTextEditingController,
    required this.quantityTextEditingController,
    required this.lowBoundTextEditingController,
    this.onTap, this.uploadImgFun,
  });

  final TextEditingController medicineNameTextEditingController;
  final TextEditingController pharmaceuticalCompositionTEController;
  final TextEditingController companyTextEditingController;
  final TextEditingController pharmaceuticalIndicationTEController;
  final TextEditingController priceTextEditingController;
  final TextEditingController quantityTextEditingController;
  final TextEditingController lowBoundTextEditingController;
  final GlobalKey<FormState> formKey;
  final void Function()? onTap;
  final void Function()? uploadImgFun;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormFieldWithTitle(
            title: "Enter The name of medicine",
            hintText: "Medicine name",
            controller: medicineNameTextEditingController,
          ),
          TextFormFieldWithTitle(
            title: "Enter The pharmaceutical composition of medicine",
            hintText: "pharmaceutical composition",
            controller: pharmaceuticalCompositionTEController,
            minLines: 2,
          ),
          TextFormFieldWithTitle(
            title: "Choose company name",
            hintText: "Company name",
            controller: companyTextEditingController,
          ),
          TextFormFieldWithTitle(
            title: "Enter the pharmaceutical indication",
            hintText: "pharmaceutical indication",
            controller: pharmaceuticalIndicationTEController,
            minLines: 3,
          ),
          TextFormFieldWithTitle(
            title: "Enter the Medicine price",
            hintText: "price",
            controller: priceTextEditingController,
            keyboardType: TextInputType.number,
          ),
          TextFormFieldWithTitle(
            title: "Enter the Medicine quantity",
            hintText: "Quantity",
            controller: quantityTextEditingController,
            keyboardType: TextInputType.number,
          ),
          TextFormFieldWithTitle(
            title: "Enter the Medicine low bound",
            hintText: "Low Bound",
            controller: lowBoundTextEditingController,
            keyboardType: TextInputType.number,
          ),
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: UploadPhoto(
                onTap: uploadImgFun,
              )),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            title: "Submit",
            onTap: onTap,
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
