import 'dart:io';
import 'package:online_shop_ui/provider/user_profile__provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File _selectedImage;
  final picker = ImagePicker();

  Future pickImage(BuildContext context) async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
    await UserImageProvider.uploaProfileImage(context, _selectedImage);
    await UserImageProvider.getProfileImage();
  }

  @override
  Widget build(BuildContext context) {
    // final providerData = Provider.of<UserImageProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.height * 0.15,
      height: size.height * 0.15,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        // overflow: Overflow.visible,
        children: [
          SizedBox(
            child: FutureBuilder(
              future: UserImageProvider.getProfileImage(),
              builder: (ctx, data) {
                // print(data.data);

                return data.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : data.data == null
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : CircleAvatar(
                            backgroundImage: MemoryImage(data.data),
                          );
              },
            ),
          ),
          Positioned(
            right: -size.height * 0.015,
            bottom: 0,
            child: SizedBox(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFFF5F6F9),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: size.height * 0.05,
                ),
                onPressed: () async {
                  await pickImage(context);
                  setState(() {});
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
