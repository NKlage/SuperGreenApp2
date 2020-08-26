/*
 * Copyright (C) 2018  SuperGreenLab <towelie@supergreenlab.com>
 * Author: Constantin Clauzel <constantin.clauzel@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_green_app/data/api/backend/products/models.dart';
import 'package:super_green_app/main/main_navigator_bloc.dart';
import 'package:super_green_app/pages/products/product_supplier/product_supplier_bloc.dart';
import 'package:super_green_app/widgets/appbar.dart';
import 'package:super_green_app/widgets/green_button.dart';
import 'package:super_green_app/widgets/section_title.dart';

class ProductSupplierPage extends StatefulWidget {
  @override
  _ProductSupplierPageState createState() => _ProductSupplierPageState();
}

class _ProductSupplierPageState extends State<ProductSupplierPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductSupplierBloc, ProductSupplierBlocState>(
      listener: (BuildContext context, ProductSupplierBlocState state) {},
      child: BlocBuilder<ProductSupplierBloc, ProductSupplierBlocState>(
        builder: (BuildContext context, ProductSupplierBlocState state) {
          Widget body = Column(children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SectionTitle(
                      title: 'Where did you buy it?',
                      icon: 'assets/products/toolbox/icon_item_type.svg',
                      iconPadding: 0,
                    ),
                  ),
                  renderTextField(context, 'Link', 'Ex: https://amazon.com/...',
                      urlController),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: GreenButton(
                  title: 'CREATE PRODUCT',
                  onPressed: nameController.text == ''
                      ? null
                      : () {
                          Product product = Product(
                              name: nameController.text,
                              supplier: urlController.text != ''
                                  ? ProductSupplier(url: urlController.text)
                                  : null);
                          BlocProvider.of<MainNavigatorBloc>(context)
                              .add(MainNavigatorActionPop(param: product));
                        },
                ),
              ),
            ),
          ]);
          return Scaffold(
              appBar: SGLAppBar(
                '🛠',
                fontSize: 40,
                backgroundColor: Color(0xff0EA9DA),
                titleColor: Colors.white,
                iconColor: Colors.white,
              ),
              backgroundColor: Colors.white,
              body: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200), child: body));
        },
      ),
    );
  }

  Widget renderTextField(BuildContext context, String labelText,
      String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black38),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        ),
        style: TextStyle(color: Colors.black, decoration: TextDecoration.none),
        controller: controller,
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }
}
