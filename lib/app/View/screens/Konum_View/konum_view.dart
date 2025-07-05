import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/app/View/screens/Konum_View/konum_viewmodel.dart';
import 'package:rickandmorty/app/View/widgets/appbar_widgets.dart';
import 'package:rickandmorty/app/View/widgets/decoration_widgets.dart';
import 'package:rickandmorty/models/konum_model.dart';

class KonumView extends StatefulWidget {
  const KonumView({super.key});

  @override
  State<KonumView> createState() => _KonumViewState();
}

class _KonumViewState extends State<KonumView> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<KonumViewmodel>().getlocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppbarWidgets(title: 'konumlar', transparent: true),
        extendBodyBehindAppBar: true,
        body: Center(
          child: DecorationWidgets(
            topChild: SizedBox(height: 74),
            child: _konumlistview(),
          ),
        ),
      ),
    );
  }

  Flexible _konumlistview() {
    return Flexible(
      child: Consumer<KonumViewmodel>(
        builder: (context, viewmodel, child) {
          if (viewmodel.locationModel == null) {
            return const CircularProgressIndicator.adaptive();
          } else {
            return ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: viewmodel.locationModel!.locations.length,
              itemBuilder: (context, index) {
                final LocationItem location =
                    viewmodel.locationModel!.locations[index];
                return ListTile(
                  leading: Icon(Icons.face, size: 35),
                  title: Text(location.name),
                  subtitle: Text(location.type),

                  trailing: Icon(Icons.keyboard_arrow_right),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: Theme.of(context).colorScheme.tertiary,
                indent: 20,
                endIndent: 20,
              ),
            );
          }
        },
      ),
    );
  }
}
