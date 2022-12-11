import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_frontend/interface/components/arc_background.dart';
import 'package:yoga_frontend/interface/screens/payment_screen/payment.dart';
import 'package:yoga_frontend/interface/screens/register_form/slot_radio_buttons.dart';
import '../../../constants/values.dart';
import '../../../models/person_model.dart';
import '../../../services/change_slot.dart';
import '../../components/buttons.dart';
import '../register_form/registration_form_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // resizeToAvoidBottomInset: false,
        body: ArcBackground(
      heading: "Student Dashboard",
      child: DashboardBody(),
    ));
  }
}

class DashboardBody extends StatefulWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody>
    with SingleTickerProviderStateMixin {
  String name = "";
  int slot = 1;
  String id = "";
  bool logging = false;

  @override
  Widget build(BuildContext context) {
    print(Provider.of<Person>(context).toJson());
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text(Provider.of<Person>(context).name),
      Text("Registration ID: ${Provider.of<Person>(context).id}"),
      if (Provider.of<Person>(context).getFeesStatus == "M")
        const Text("Fees due for multiple months. Pay your fees immediately"),
      if (Provider.of<Person>(context).getFeesStatus == "RNP")
        const Text("Registration Fees not yet Paid. Pay your fees immediately"),
      Row(
        children: [
          Text(
              "Slot Booked for ${slotsTime[Provider.of<Person>(context).slot]}"),
          AppElevatedButton(
            onPressed: () {
              showBottomSheet(
                  context: context,
                  builder: (context) => BottomSheet(
                        onClosing: () {
                          Provider.of<Person>(context, listen: false)
                              .changeSlot(slot);
                          changeSlot(
                              Provider.of<Person>(context, listen: false).id,
                              slot);
                        },
                        builder: (context) => SlotRadioButtons(
                          onChanged: (val) {
                            slot = val;
                            Navigator.pop(context);
                          },
                          slot: Provider.of<Person>(context).changedslot ?? 1,
                        ),
                        animationController: AnimationController(vsync: this),
                      ));
            },
            text: "Change Slot",
          ),
        ],
      ),
      Row(
        children: [
          Text(
              "Fees Status:${Provider.of<Person>(context).getBeutifiedFeesStatus}"),
          if (Provider.of<Person>(context).getFeesStatus != "P")
            AppElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            PaymentsPage(Provider.of<Person>(context).id))));
              },
              text: "Pay Fees",
            ),
        ],
      ),
      AppElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const RegisterPage())));
        },
        text: "Withdraw from the class",
      ),
    ]);
  }
}
