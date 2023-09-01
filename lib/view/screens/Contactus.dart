import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Contactus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us')),
      body: Padding(
        padding: const EdgeInsets.all(200.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 237, 237, 237),
          ),
          padding: const EdgeInsets.all(50.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildImageSection(),
              ),
              Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildReplySection(),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/logo.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildReplySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Leave A Reply',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 10),
        Text(
          'Your email address will not be published. Required fields are marked *',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 10),
        TextField(decoration: InputDecoration(hintText: "Name")),
        SizedBox(height: 10),
        TextField(decoration: InputDecoration(hintText: "Email")),
        SizedBox(height: 10),
        TextField(decoration: InputDecoration(hintText: "Subject")),
        SizedBox(height: 20),
        ElevatedButton(onPressed: () {}, child: Text('Submit'))
      ],
    );
  }
}
