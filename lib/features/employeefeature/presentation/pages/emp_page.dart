import 'package:adminfeature/features/employeefeature/domain/entities/emp_request_entity.dart';
import 'package:adminfeature/features/employeefeature/presentation/bloc/emp_cubit.dart';
import 'package:adminfeature/features/employeefeature/presentation/bloc/employeefeature_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmpPage extends StatefulWidget {
  const EmpPage({super.key});

  @override
  State<EmpPage> createState() => _EmpPageState();
}

class _EmpPageState extends State<EmpPage> {
  @override
  void initState() {
    context.read<EmpCubit>().getEmpDataList(
          const EmpReqEntity(employeeId: ''),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee'),
      ),
      body: BlocBuilder<EmpCubit, EmployeefeatureState>(
        buildWhen: (previous, current) {
          if (current is EmployeefeatureLoaded ||
              current is EmployeefeatureLoading) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is EmployeefeatureLoading) {
            return const SizedBox(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.amberAccent,
              ),
            );
          } else if (state is EmployeefeatureError) {
            return Text(
              state.serverFailure.errorMessage.toString(),
            );
          } else if (state is EmployeefeatureLoaded) {
            if (state.employeeLi.isEmpty) {
              return const Text('No Data Found');
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.employeeLi.length,
                itemBuilder: (context, index) {
                  final item = state.employeeLi[index];
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
