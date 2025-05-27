import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ish_topdim/core/components/main_back_button.dart';
import 'package:ish_topdim/features/home/filtering/steps/for_whom/for_whom_step.dart';
import 'package:ish_topdim/features/home/filtering/steps/salary/salary_step.dart';
import 'package:ish_topdim/features/home/filtering/steps/work_time/work_time_step.dart';
import '../steps/category/category_step.dart';


class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int currentStep = 0;

  void nextStep() {
    if (currentStep < 3) {
      setState(() {
        currentStep++;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Filterlash tugadi')),
      );
    }
  }

  void previousStep(){
    if(currentStep==0){
       if(mounted){
          context.pop(context);
        }
    }
    else{
      setState(() {
        currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final steps = [
      CategoryStep(onNext: nextStep),
      ForWhomStep(onNext: nextStep),
      WorkTimeStep(onNext: nextStep),
      SalaryStep(onNext: nextStep)
    ];
    return Scaffold(
      appBar: AppBar(
        leading: MainBackButton(onPressed: () {
          previousStep();
        }),
      ),
      body: steps[currentStep],
    );
  }
}




