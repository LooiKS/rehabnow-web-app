from PIL import Image
import time
from django.conf import settings
import os


class ProfileImageService:
    def __init__(self, src, user_id, upload_filename):
        self.src = src
        self.user_id = user_id
        self.upload_filename = upload_filename

    def save(self):
        cropped = img = Image.open(self.src)
        width = img.width
        height = img.height
        if width < height:
            length_to_cropped = (height - width) / 2
            cropped = img.crop(
                (
                    0,
                    length_to_cropped,
                    width,
                    length_to_cropped + width,
                )
            )
        elif height < width:
            length_to_cropped = (width - height) / 2
            cropped = img.crop(
                (length_to_cropped, 0, length_to_cropped + height, height)
            )

        t = str(time.time() * 1000)
        filepath = "/profile-images/"
        filename = (
            self.user_id
            + "-"
            + t[: t.index(".")]
            + self.upload_filename[self.upload_filename.index(".") :]
        )
        absolute_filepath = settings.MEDIA_ROOT + filepath + filename
        cropped.save(absolute_filepath)
        return filepath + filename

    def save_and_delete(self, ori_photo):
        file = self.save()
        try:
            os.remove(settings.MEDIA_ROOT + ori_photo)
        except Exception as e:
            print(e)
        return file
