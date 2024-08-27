part of 'notifications_s.dart';

class NotificationsScreen extends StatelessWidget {
  static const String routeName = "/notifications_screen";
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NotificationsAppBar(title: "Notifications"),
      floatingActionButton: CustomButton(
        title: "Add a reminder",
        onTap: () {
          AddReminderDialog.builder(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: const SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              NotificationsHeader(),
              SizedBox(
                height: 20,
              ),
              NotificationCard(
                notificationDesc: 'it is time to take ilvicone',
              ),
              NotificationCard(
                notificationDesc: 'it is time to take toplex',
              ),
              NotificationCard(
                notificationDesc: 'it is time to take klaritine',
              ),
            ],
          ),
        ),
      )),
    );
  }
}
