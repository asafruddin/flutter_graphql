import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_architecture/bloc/location/location_detail/location_detail_bloc.dart';
import 'package:flutter_graphql_architecture/core/di/injector_container.dart';

class DetailLocation extends StatefulWidget {
  const DetailLocation({Key? key, required this.idLocation}) : super(key: key);

  final String idLocation;

  @override
  _DetailLocationState createState() => _DetailLocationState();
}

class _DetailLocationState extends State<DetailLocation> {
  final detailLocBloc = sl<LocationDetailBloc>();

  @override
  void initState() {
    super.initState();
    detailLocBloc.add(OnReqLocationDetail(widget.idLocation));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => detailLocBloc,
      child: BlocBuilder<LocationDetailBloc, LocationDetailState>(
        builder: (context, state) {
          if (state is ReqLocationDetailLoading) {
            return const ListTile(
                title: Center(child: CircularProgressIndicator()));
          } else if (state is ReqLocationDetailFailure) {
            return ListTile(title: Text(state.error ?? "Error"));
          } else if (state is ReqLocationDetailSuccess) {
            return Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Name'),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
