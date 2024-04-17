import 'package:barber_shop/app/modules/schedule/presentation/controllers/schedule_controllers.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/constants.dart';
import '../widgets/list_barbers_man.dart';
import '../widgets/list_hours_avaliables_widget.dart';


class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  
  DateTime selectDate = DateTime.now();
  final controller = ScheduleController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agendamento')),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Barbeiros', style: TextStyle(fontSize: 18)),
                const ListBarbersMan(list: ['Fulano de tal', 'Fulano de tal'], ),
                const SizedBox(height: 16,),
                const Text('Data', style: TextStyle(fontSize: 18)),
                 EasyInfiniteDateTimeLine(
                  dayProps: const EasyDayProps(
                    dayStructure: DayStructure.dayNumDayStr,
                  ),
                  activeColor: Theme.of(context).colorScheme.secondaryContainer,
                  onDateChange: (selectedDate){
                    if(selectedDate.weekday != 7){ // lógica de negócio que deveria estar em outro lugar
                      setState(() {
                        selectDate = selectedDate;
                        //widget.hoursBloc.add(HoursScheduleEvent(selectDate.weekday));
                      });
                    }
                  },
                  locale: "pt-br", 
                  firstDate: Constants.firstDay, 
                  focusDate: selectDate, 
                  lastDate: Constants.lastDay,
                ),
                const SizedBox(height: 16,),
                const Text('Horários Disponíveis', style: TextStyle(fontSize: 18)),
                const ListHoursAvailablesWidget(list: ['9:00', '10:00', '11:00', '14:00', '15:00'],),
                
              ],
            ),
          );
        }
      )
    );
  }
}