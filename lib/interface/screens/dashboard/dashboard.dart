import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_frontend/constants/colors.dart';
import 'package:yoga_frontend/constants/text_styles.dart';
import 'package:yoga_frontend/interface/components/academy_logo.dart';
import 'package:yoga_frontend/interface/components/arc_background.dart';
import 'package:yoga_frontend/interface/screens/dashboard/outlinemessage.dart';
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
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      AcademyLogo(
        size: 40,
        hasText: false,
      ),
      Column(
        children: [
          Text(Provider.of<Person>(context).name.toUpperCase(),
              style: TextStyle(
                  fontSize: 28,
                  color: AppColors.buttonColor,
                  fontWeight: FontWeight.bold)),
          Text("Registration ID: ${Provider.of<Person>(context).id}",
              style: TextStyle(color: AppColors.buttonColor)),
        ],
      ),
      if (Provider.of<Person>(context).getFeesStatus == "M" ||
          Provider.of<Person>(context).getFeesStatus == "RNP")
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          padding: const EdgeInsets.all(10),
          child: Provider.of<Person>(context).getFeesStatus == "M"
              ? const Text(
                  "Fees due for multiple months. Pay your fees immediately",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subheading)
              : const Text(
                  "Registration Fees not yet Paid. Pay your fees immediately",
                  style: AppTextStyles.subheading,
                  textAlign: TextAlign.center,
                ),
        ),
      Column(
        children: [
          OutlineMessage(
            heading: "Slot",
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "${slotsTime[Provider.of<Person>(context).slot]}",
                    style: AppTextStyles.strongStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                AppElevatedButton(
                  onPressed: () {
                    showBottomSheet(
                      enableDrag: true,
                      elevation: 3,
                      context: context,
                      builder: (context) => Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(15),
                        child: SlotRadioButtons(
                          onChanged: (val) {
                            Provider.of<Person>(context, listen: false)
                                .changeSlot(val);
                            changeSlot(
                                Provider.of<Person>(context, listen: false).id,
                                val);
                            Navigator.pop(context);
                          },
                          slot: Provider.of<Person>(context).changedslot ?? 1,
                        ),
                      ),
                    );
                  },
                  text: "Change Slot",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          if (Provider.of<Person>(context).slot !=
              Provider.of<Person>(context).changedslot)
            Text(
              "Next Month Slot: ${slotsTime[Provider.of<Person>(context).changedslot]}",
              style: AppTextStyles.strongStyle.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
        ],
      ),
      OutlineMessage(
        heading: "Fees Status",
        child: Row(
          children: [
            Expanded(
              child: Text(
                Provider.of<Person>(context).getBeutifiedFeesStatus,
                style: AppTextStyles.strongStyle.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            if (Provider.of<Person>(context).getFeesStatus != "P")
              AppElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => PaymentsPage(
                              Provider.of<Person>(context).id,
                              dueno:
                                  Provider.of<Person>(context).getDueMonths))));
                },
                text: "Pay Fees",
              ),
          ],
        ),
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
