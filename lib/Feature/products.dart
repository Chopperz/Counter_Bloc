import 'package:flutter/material.dart';
import 'package:flutter101/Bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CounterBloc>().add(const FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      bloc: context.read<CounterBloc>(),
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('PRODUCT SCREEN'),
          ),
          body: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            itemBuilder: (_, int index) {
              return Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${index + 1}. ",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                state.userModel[index].name,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "    ${state.userModel[index].username}",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Price: ${(index + 1) * 2}",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "${state.userModel[index].counter}",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () => context.read<CounterBloc>().add(IncrementEvent(
                                        id: state.userModel[index].id,
                                        price: (index + 1) * 2,
                                        counter: state.userModel[index].counter,
                                      )),
                                  icon: const Icon(Icons.add),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (__, index) => const SizedBox(height: 10),
            itemCount: state.userModel.length,
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(10).copyWith(bottom: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("TOTAL: ", style: Theme.of(context).textTheme.titleLarge),
                Text(
                  "${state.total} THB",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
