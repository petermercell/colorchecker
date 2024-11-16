from colour import matrix_colour_correction, read_image
from colour_checker_detection import detect_colour_checkers_segmentation

source_filename = "source.exr"
target_filename = "target.exr"

source = detect_colour_checkers_segmentation(read_image(source_filename))[0]
target = detect_colour_checkers_segmentation(read_image(target_filename))[0]

matrix = matrix_colour_correction(source, target)

print(matrix)