part of 'profile_s.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBar(
        title: "Profile",
        arrowBackFunc: () {
          final navigationController = Get.find<NavigationController>();
          navigationController.jumpTo(0);
        },
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ProfileHeader(
              userType: profileController.userType,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldWithTitle(
                title: "Your Name:",
                hintText: "",
                controller: profileController.nameTexteditingController),
            TextFormFieldWithTitle(
                title: "Email:",
                hintText: "",
                controller: profileController.emailTexteditingController),
            TextFormFieldWithTitle(
                title: "password:",
                hintText: "",
                isPassword: true,
                maxLines: 1,
                controller: profileController.passwordTexteditingController),
            const SizedBox(
              height: 50,
            ),
            const CustomButton(title: "Update"),
            // SizedBox(height: 200.h,),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Text(
                    "Log Out",
                    style: Theme.of(context).textTheme.bodyMedium!,
                  ),
                  onTap: () {
                    LogOutDialog.builder(context);
                  },
                ),
                const Text("   ||   "),
                InkWell(
                  child: Text(
                    "Delete Account",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.red),
                  ),
                  onTap: () {
                    DeleteAccountDialog.builder(context);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
            // const GoToOperation(opName: "Log Out"),
            // const GoToOperation(
            //   opName: "Delete Account",
            //   isDelete: true,
            // ),
          ],
        ),
      )),
    );
  }
}
