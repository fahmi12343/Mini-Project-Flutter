import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/features/dashboard/domain/entities/datadiri.dart';
import 'package:mini_project/features/dashboard/presentation/bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mini_project/theme/color.dart';
import 'package:mini_project/theme/textstyle.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:mini_project/service_locator.dart';
import 'dashboard_page_datadiri.dart';
import 'edit_dashboard_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

const String DataDiriBoxName = "BOX_Friends";

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(LoadDashboard());
    BlocProvider.of<DashboardBloc>(context).add(GetDashboard());
  }

  // final _formKey = GlobalKey<FormState>();

  late String nm;
  late String gender;
  late String tempLahir;
  late String tglLahir;
  late String jlnPertama;
  late String provinsiPertama;
  late String kabupatenPertama;
  late String kecamatanPertama;
  late String desaPertama;
  late String rtPertama;
  late String rwPertama;
  late String jlnKedua;
  late String provinsiKedua;
  late String kabupatenKedua;
  late String kecamatanKedua;
  late String desaKedua;
  late String rtKedua;
  late String rwKedua;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.red,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    "Dashboard",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(130, 15, 0, 0),
                  child: CircleAvatar(backgroundColor: ColorPalette.primary),
                )
              ],
            ),
            SizedBox(
              height: 26,
            ),
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(33, 5, 33, 5),
            //       child: Container(
            //         width: MediaQuery.of(context).copyWith().size.height / 2.2,
            //         height: MediaQuery.of(context).copyWith().size.height / 14,
            //         decoration: BoxDecoration(
            //           color: ColorPalette.pureWhite,
            //           borderRadius: BorderRadius.vertical(
            //             top: Radius.circular(12),
            //             bottom: Radius.circular(12),
            //           ),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(5),
            //           child: FormBuilderTextField(
            //             // controller: _namaController,
            //             name: 'search',
            //             decoration: InputDecoration(
            //               focusedBorder: OutlineInputBorder(
            //                 borderSide: BorderSide(color: ColorPalette.gray300),
            //                 borderRadius: BorderRadius.circular(20.0),
            //               ),
            //               suffixIcon: Icon(
            //                 Icons.search_outlined,
            //                 color: Colors.black,
            //                 size: 30,
            //               ),
            //               labelText: 'Search',
            //               enabledBorder: OutlineInputBorder(
            //                 borderSide: BorderSide(
            //                   color: ColorPalette.gray300,
            //                 ),
            //                 borderRadius: BorderRadius.circular(20.0),
            //               ),
            //               fillColor: ColorPalette.gray300,
            //               filled: true,
            //             ),
            //             validator: FormBuilderValidators.compose(
            //               [
            //                 FormBuilderValidators.required(context),
            //                 FormBuilderValidators.maxLength(context, 25),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            ValueListenableBuilder(
                valueListenable:
                    Hive.box<DataDiri>(DataDiriBoxName).listenable(),
                builder: (context, Box<DataDiri> box, _) {
                  // print(box.values.isEmpty);
                  if (box.values.isEmpty)
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text("No Data"));
                  SizedBox(
                    height: 32,
                  );
                  return Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).copyWith().size.height / 1.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(42),
                        bottom: Radius.elliptical(12, 12),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 10, right: 10),
                      child: ListView.builder(
                        itemCount: box.values.length,
                        itemBuilder: (context, index) {
                          var currentDataDiri = box.getAt(index);
                          var indeks = index;
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)
                            ),
                            color: ColorPalette.gray300,
                           child: ListTile(
                            title: Text(
                              currentDataDiri!.name,
                              style: TextPalette.fieldStyle,
                            ),
                            subtitle: Text(currentDataDiri.jalan),
                            leading: CircleAvatar(
                              backgroundColor: ColorPalette.primary,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                PopupMenuButton(
                                    itemBuilder: (context) => [
                                          PopupMenuItem(
                                            child: TextButton.icon(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) {
                                                      return Dialog(
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  20, 30, 0, 0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                "Alamat Data Diri ",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              Divider(),
                                                              Text("Nama : " +
                                                                  currentDataDiri
                                                                      .name),
                                                              Text("Jenis Kelamin : " +
                                                                  currentDataDiri
                                                                      .jenisKelamin),
                                                              Text("Tempat : " +
                                                                  currentDataDiri
                                                                      .tempat),
                                                              Text("Tanggal Lahir :" +
                                                                    DateFormat(
                                                                            'yyyy-MM-dd')
                                                                        .format(
                                                                            currentDataDiri.tanggalLahir)),
                                                              Text(""),
                                                              Text(
                                                                  "Alamat KTP "),
                                                              Divider(),
                                                              Text("Jalan : " +
                                                                  currentDataDiri
                                                                      .jalan),
                                                              Text("Provinsi : " +
                                                                  currentDataDiri
                                                                      .provinsiKtp),
                                                              Text("Kota/kabupaten : " +
                                                                  currentDataDiri
                                                                      .kabupatenKtp),
                                                              Text("Kecamatan : " +
                                                                  currentDataDiri
                                                                      .kecamatanKtp),
                                                              Text("Kelurahan/Desa : " +
                                                                  currentDataDiri
                                                                      .desaKtp),
                                                              Text("RT : " +
                                                                  currentDataDiri
                                                                      .rtKtp),
                                                              Text("Rw : " +
                                                                  currentDataDiri
                                                                      .rwKtp),
                                                              Text(""),
                                                              Text(
                                                                  "Alamat Tempat Tinggal "),
                                                              Divider(),
                                                              Text("Jalan : " +
                                                                  currentDataDiri
                                                                      .jalanRumah),
                                                              Text("Provinsi : " +
                                                                  currentDataDiri
                                                                      .provinsiRumah),
                                                              Text("Kota/kabupaten : " +
                                                                  currentDataDiri
                                                                      .kabupatenRumah),
                                                              Text("Kecamatan : " +
                                                                  currentDataDiri
                                                                      .kecamatanRumah),
                                                              Text("Kelurahan/Desa : " +
                                                                  currentDataDiri
                                                                      .desaRumah),
                                                              Text("RT : " +
                                                                  currentDataDiri
                                                                      .rtRumah),
                                                              Text("Rw : " +
                                                                  currentDataDiri
                                                                      .rwRumah),
                                                              SizedBox(
                                                                height: 15,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                                // Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.info_outline,
                                                  color: ColorPalette.black,
                                                  size: 20),
                                              label: Text(
                                                "Detail",
                                                style: TextStyle(
                                                    color: ColorPalette.black),
                                              ),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            child: TextButton.icon(
                                              onPressed: () {
                                                Alert(
                                                  context: context,
                                                  type: AlertType.info,
                                                  title: "EDIT DATA",
                                                  desc:
                                                      "Apa anda yakin ingin mengedit data.",
                                                  buttons: [
                                                    DialogButton(
                                                        child: Text(
                                                          "EDIT",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            indeks = index;
                                                            nm = currentDataDiri
                                                                .name;
                                                            gender =
                                                                currentDataDiri
                                                                    .jenisKelamin;
                                                            tempLahir =
                                                                currentDataDiri
                                                                    .tempat;
                                                            tglLahir =
                                                                currentDataDiri
                                                                    .tanggalLahir
                                                                    .toString();
                                                            jlnPertama =
                                                                currentDataDiri
                                                                    .jalan;
                                                            provinsiPertama =
                                                                currentDataDiri
                                                                    .provinsiKtp;
                                                            kabupatenPertama =
                                                                currentDataDiri
                                                                    .kabupatenKtp;
                                                            kecamatanPertama =
                                                                currentDataDiri
                                                                    .kecamatanKtp;
                                                            desaPertama =
                                                                currentDataDiri
                                                                    .desaKtp;
                                                            rtPertama =
                                                                currentDataDiri
                                                                    .rtKtp;
                                                            rwPertama =
                                                                currentDataDiri
                                                                    .rwKtp;
                                                            jlnKedua =
                                                                currentDataDiri
                                                                    .jalanRumah;
                                                            provinsiKedua =
                                                                currentDataDiri
                                                                    .provinsiRumah;
                                                            kabupatenKedua =
                                                                currentDataDiri
                                                                    .kabupatenRumah;
                                                            kecamatanKedua =
                                                                currentDataDiri
                                                                    .kecamatanRumah;
                                                            desaKedua =
                                                                currentDataDiri
                                                                    .desaRumah;
                                                            rtKedua =
                                                                currentDataDiri
                                                                    .rtRumah;
                                                            rwKedua =
                                                                currentDataDiri
                                                                    .rwRumah;
                                                          });

                                                          Navigator
                                                              .pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                                return BlocProvider(
                                                                  create: (_) =>
                                                                      serviceLocator
                                                                          .get<
                                                                              DashboardBloc>(),
                                                                  child:
                                                                      EditDataDiriForm(
                                                                    index:
                                                                        indeks,
                                                                    nama: nm,
                                                                    gender:
                                                                        gender,
                                                                    tempLahir:
                                                                        tempLahir,
                                                                    tglLahir:
                                                                        tglLahir,
                                                                    jlnPertama:
                                                                        jlnPertama,
                                                                    provPertama:
                                                                        provinsiPertama,
                                                                    kabPertama:
                                                                        kabupatenPertama,
                                                                    kecPertama:
                                                                        kecamatanPertama,
                                                                    desaPertama:
                                                                        desaPertama,
                                                                    ertPertama:
                                                                        rtPertama,
                                                                    erwPertama:
                                                                        rwPertama,
                                                                    jlnKedua:
                                                                        jlnKedua,
                                                                    provKedua:
                                                                        provinsiKedua,
                                                                    kabKedua:
                                                                        kabupatenKedua,
                                                                    kecKedua:
                                                                        kecamatanKedua,
                                                                    desaKedua:
                                                                        desaKedua,
                                                                    ertKedua:
                                                                        rtKedua,
                                                                    erwKedua:
                                                                        rwKedua,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                        color:
                                                            ColorPalette.main),
                                                    DialogButton(
                                                        child: Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        color:
                                                            ColorPalette.main)
                                                  ],
                                                ).show();
                                              },
                                              icon: Icon(
                                                Icons.edit_outlined,
                                                color: ColorPalette.black,
                                              ),
                                              label: Text(
                                                "Edit",
                                                style: TextStyle(
                                                    color: ColorPalette.black),
                                              ),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            child: TextButton.icon(
                                              onPressed: () {
                                                Alert(
                                                  context: context,
                                                  type: AlertType.warning,
                                                  title: "DELETE DATA",
                                                  desc:
                                                      "Apa anda yakin menghapus data.",
                                                  buttons: [
                                                    DialogButton(
                                                        child: Text(
                                                          "Delete",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                        onPressed: () {
                                                          box.deleteAt(index);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        color:
                                                            ColorPalette.main),
                                                    DialogButton(
                                                        child: Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        color:
                                                            ColorPalette.main)
                                                  ],
                                                ).show();
                                              },
                                              icon: Icon(
                                                Icons.delete_outline_outlined,
                                                color: ColorPalette.black,
                                              ),
                                              label: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: ColorPalette.black),
                                              ),
                                            ),
                                          )
                                        ]),
                              ],
                            ),
                           ),
                          );
                        },
                      ),
                    ),
                  );
                })
          ],
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.mail),
      //       label: "Mail",
      //     ),
      //   ],
      // ),
    );
  }
}
