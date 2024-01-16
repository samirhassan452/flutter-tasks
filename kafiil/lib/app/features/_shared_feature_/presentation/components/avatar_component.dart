part of '../../shared_feature.exports.dart';

class AvatarComponent extends StatefulWidget {
  final bool readOnly;
  final String? assetName;
  final ValueChanged<XFile>? onSelected;
  final ValueChanged<FileInfo>? onSelectedFile;
  const AvatarComponent({
    super.key,
    this.readOnly = false,
    this.assetName,
    this.onSelected,
    this.onSelectedFile,
  });

  @override
  State<AvatarComponent> createState() => _AvatarComponentState();
}

class _AvatarComponentState extends State<AvatarComponent> {
  late ValueNotifier<String?> imageNotifier;

  @override
  void initState() {
    imageNotifier = ValueNotifier(null);
    super.initState();
  }

  @override
  void dispose() {
    imageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(const Size.square(85.0)),
      alignment: Alignment.center,
      child: Stack(
        alignment: const AlignmentDirectional(1.0, 1.0),
        clipBehavior: Clip.none,
        children: [
          Container(
            constraints: BoxConstraints.tight(const Size.square(85.0)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.primary900),
            ),
            child: ValueListenableBuilder(
              valueListenable: imageNotifier,
              builder: (_, String? imagePath, __) {
                ImageProvider provider = AssetImage(assetName);
                if (imagePath != null) {
                  provider = FileImage(File(imagePath));
                } else if (isNetworkImage) {
                  provider = NetworkImage(assetName);
                }
                return CircleAvatar(
                  // radius: 40.0 / 2.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: provider,
                );
              },
            ),
          ),
          //
          if (widget.readOnly == false) ...[
            IconButton(
              onPressed: _onPickImage,
              color: AppColor.primary900,
              constraints: BoxConstraints.tight(const Size.square(32.0)),
              style: IconButton.styleFrom(
                backgroundColor: AppColor.primary900,
              ),
              icon: const Icon(Icons.add, color: AppColor.white),
            ),
          ],
        ],
      ),
    );
  }

  bool get isNetworkImage => assetName.isNotEmpty && assetName.contains('http');
  String get assetName =>
      widget.assetName != null && widget.assetName!.isNotEmpty
          ? widget.assetName!
          : IconPath.avatarPlaceholder;

  void _onPickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageNotifier.value = image.path;
      widget.onSelected?.call(image);

      final bytes = await AppConfig.fileToBytes(image.path);
      widget.onSelectedFile?.call(FileInfo.fromXFile(image, bytes: bytes));
    }
  }
}
