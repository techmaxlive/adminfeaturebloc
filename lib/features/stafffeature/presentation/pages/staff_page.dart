import 'package:adminfeature/features/stafffeature/domain/entities/staff_request_entity.dart';
import 'package:adminfeature/features/stafffeature/presentation/bloc/staff_cubit.dart';
import 'package:adminfeature/features/stafffeature/presentation/bloc/staff_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffPage extends StatefulWidget {
  const StaffPage({super.key});

  @override
  State<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  @override
  void initState() {
    context.read<StaffCubit>().getStaffDataList(
          const StaffReqEntity(staffId: ''),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staff'),
      ),
      body: BlocBuilder<StaffCubit, StafffeatureState>(
        buildWhen: (previous, current) {
          if (current is StaffLoding || current is StaffLoaded) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is StaffLoding) {
            return const SizedBox(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.amberAccent,
              ),
            );
          } else if (state is StaffError) {
            return Text(
              state.serverFailure.errorMessage.toString(),
            );
          } else if (state is StaffLoaded) {
            if (state.staffLi.isEmpty) {
              return const Text('No Data Found');
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.staffLi.length,
                itemBuilder: (context, index) {
                  final item = state.staffLi[index];
                  return Card(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(item.name),
                      ));
                },
              );
            }
          }
          return const Text('No Data Found');
        },
      ),
    );
  }
}
