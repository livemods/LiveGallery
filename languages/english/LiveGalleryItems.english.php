<?php

/**
 * @package   LiveGallery
 * @version   1.0
 * @author    John Rayes <live627@gmail.com>
 * @copyright Copyright (c) 2016, John Rayes
 * @license   proprietary
 */

$txt['LiveGalleryItems_no_unseen'] = 'No unseen items';
$txt['LiveGalleryItems_no_matches'] = 'No items matched your search';
$txt['LiveGalleryItems_search_operator'] = 'Operator';
$txt['LiveGalleryItems_search_description'] = 'Description';
$txt['LiveGalleryItems_search_operators'] = [
    ['+', 'Include, the word must be present'],
    ['-', 'Exclude, the word must not be present'],
    ['"', 'Denotes a phrase to match against'],
];
$txt['LiveGalleryItems_keyword'] = 'Keywords';
$txt['LiveGalleryItems_keyword_desc'] = 'Modifiers are listed below';
$txt['LiveGalleryItems_title'] = 'Items';
$txt['LiveGalleryItems_desc'] = 'All of your items are shown here.';
$txt['LiveGalleryItems_add'] = 'Add';
$txt['LiveGalleryItems_edit'] = 'Edit';
$txt['LiveGalleryItems_desc'] = 'From this page you can create your own post fields that fit in with your own forum\'s requirements.';
$txt['LiveGalleryItems_make_new'] = 'New Field';
$txt['LiveGalleryItems_none'] = 'You have not created any post fields yet!';
$txt['LiveGalleryItems_general'] = 'Display Settings';
$txt['LiveGalleryItems_advanced'] = 'Advanced Settings';
$txt['LiveGalleryItems_name'] = 'Name';
$txt['LiveGalleryItems_album'] = 'Album';
$txt['LiveGalleryItems_album_desc'] = 'Album';
$txt['LiveGalleryItems_description'] = 'Description';
$txt['LiveGalleryItems_description_desc'] = 'This is shown to users when entering this information. You may use forum bbcode here.';
$txt['LiveGalleryItems_comments'] = 'Comments';
$txt['LiveGalleryItems_add_ccomment'] = 'Add Comment';
$txt['LiveGalleryItems_body'] = 'Comment';
$txt['LiveGalleryItems_body_desc'] = 'You may use forum bbcode here.';
$txt['LiveGalleryItems_upfile'] = 'File';
$txt['LiveGalleryItems_upfile_desc'] = 'File to upload.';
$txt['LiveGalleryItems_active'] = 'Active';
$txt['LiveGalleryItems_active_desc'] = 'This field will be turned off if unchecked.';
$txt['LiveGalleryItems_searchable'] = 'Searchable';
$txt['LiveGalleryItems_searchable_desc'] = 'Specifies if the fields can be searched.';
$txt['LiveGalleryItems_featured'] = 'Featured';
$txt['LiveGalleryItems_featured_desc'] = 'Promote this item to the gallery\'s landing page.';

$txt['LiveGalleryItems_delete_sure'] = 'Are you sure you wish to delete %s - all associated comments will also be deleted!';

// Metadata
$txt['lgal_additional_information'] = 'Additional Info';
$txt['lgal_filemeta'] = '%s file';
$txt['lgal_metadata_title'] = 'Title:';
$txt['lgal_metadata_artist'] = 'Artist:';
$txt['lgal_metadata_album'] = 'Album:';
$txt['lgal_metadata_album_artist'] = 'Album Artist:';
$txt['lgal_metadata_track_number'] = 'Track Number:';
$txt['lgal_metadata_genre'] = 'Genre:';
$txt['lgal_metadata_playtime_display'] = 'Running Time:';
$txt['lgal_metadata_bitrate'] = 'Bitrate:';
$txt['lgal_metadata_bitrate_kbps'] = '%skbps';
$txt['lgal_metadata_make'] = 'Camera:';
$txt['lgal_metadata_flash'] = 'Flash:';
$txt['lgal_metadata_exposuretime'] = 'Exposure Time:';
$txt['lgal_metadata_fnumber'] = 'F-number:';
$txt['lgal_metadata_focallength'] = 'Focal length:';
$txt['lgal_metadata_datetime'] = 'Time taken:';
$txt['lgal_metadata_meteringmode'] = 'Metering Mode:';
$txt['lgal_metadata_digitalzoom'] = 'Digital zoom:';
$txt['lgal_metadata_exposurebiasvalue'] = 'Exposure bias:';
$txt['lgal_metadata_maxaperturevalue'] = 'Max Aperture:';
$txt['lgal_metadata_exposuretime'] = 'Exposure Time:';
$txt['lgal_metadata_brightnessvalue'] = 'Brightness:';
$txt['lgal_metadata_contrast'] = 'Contrast:';
$txt['lgal_metadata_sharpness'] = 'Sharpness:';
$txt['lgal_metadata_isospeedratings'] = 'ISO Speed Rating:';
$txt['lgal_metadata_lightsource'] = 'Light source:';
$txt['lgal_metadata_exposureprogram'] = 'Exposure Program:';
$txt['lgal_metadata_shutterspeedvalue'] = 'Shutter speed:';
$txt['lgal_metadata_colorspace'] = 'Color Space:';
$txt['lgal_metadata_whitebalance'] = 'White balance:';
$txt['lgal_metadata_sensitivity'] = 'Sensitivity type:';
$txt['lgal_metadata_subject'] = 'Subject:';
$txt['lgal_metadata_author'] = 'Author:';
$txt['lgal_metadata_keywords'] = 'Keywords:';
$txt['lgal_metadata_comment'] = 'Comment:';
$txt['lgal_metadata_resolutionunit'] = 'Resolution:';

// Exif information
$txt['lgal_exif_camera'] = '%s (%s)';
$txt['lgal_exif_shutterspeed'] = '%d sec';
$txt['lgal_exif_fnumber'] = '<em>&#131;</em>/%s';
$txt['lgal_exif_isospeedratings'] = '%d-ISO';
$txt['lgal_exif_focallength'] = '%dmm';
$txt['lgal_exif_digitalzoom'] = '%dx';
$txt['lgal_exif_exposurebiasvalue'] = '%d step';
$txt['lgal_exif_exposuretime'] = '%d/%d sec';
$txt['lgal_exif_digital_zoom_unused'] = 'Not used';
$txt['lgal_exif_exposure'] = [
    1 => 'Manual',
    2 => 'Program',
    3 => 'Aperture Priority',
    4 => 'Shutter Priority',
    5 => 'Creative',
    6 => 'Action',
    7 => 'Portrait',
    8 => 'Landscape',
    'unknown' => 'Unknown exposure type (%1$s)',
];
$txt['lgal_exif_whitebalance'] = [
    0 => 'Auto',
    1 => 'Daylight',
    2 => 'Cloudy',
    3 => 'Tungsten',
    4 => 'Fluorescent',
    5 => 'Flash',
    6 => 'Custom',
    7 => 'Black & White',
    8 => 'Shade',
    9 => 'Manual Temperature (Kelvin)',
    10 => 'PC Set1',
    11 => 'PC Set2',
    12 => 'PC Set3',
    14 => 'Daylight Fluorescent',
    15 => 'Custom 1',
    16 => 'Custom 2',
    17 => 'Underwater',
    18 => 'Custom 3',
    19 => 'Custom 4',
    20 => 'PC Set4',
    21 => 'PC Set5',
    'unknown' => 'Unknown white balance (%1$s)',
];
$txt['lgal_exif_sensitivity'] = [
    1 => 'Standard Output Sensitivity',
    2 => 'Recommended Exposure Index',
    3 => 'ISO Speed',
    4 => 'Standard Output Sensitivity, Recommended Exposure Index',
    5 => 'Standard Output Sensitivity, ISO Speed',
    6 => 'Recommended Exposure Index, ISO Speed',
    7 => 'Standard Output Sensitivity, Recommended Exposure Index, ISO Speed',
    'unknown' => 'Unknown sensitivity type (%1$s)',
];
$txt['lgal_exif_metering'] = [
    1 => 'Average',
    2 => 'Center-Weighted Average',
    3 => 'Spot',
    4 => 'Multi-Spot',
    5 => 'Pattern',
    6 => 'Partial',
    255 => 'Other',
    'unknown' => 'Unknown metering mode (%1$s)',
];
$txt['lgal_exif_lightsource'] = [
    0 => 'Auto',
    1 => 'Daylight',
    2 => 'Flourescent',
    3 => 'Tungsten (incandescent light)',
    4 => 'Flash',
    9 => 'Fine weather',
    10 => 'Cloudy weather',
    11 => 'Shade',
    12 => 'Daylight fluorescent (D 5700 - 7100K)',
    13 => 'Day white fluorescent (N 4600 - 5400K)',
    14 => 'Cool white fluorescent (W 3900 - 4500K)',
    15 => 'White fluorescent (WW 3200 - 3700K)',
    17 => 'Standard light A',
    18 => 'Standard light B',
    19 => 'Standard light C',
    20 => 'D55',
    21 => 'D65',
    22 => 'D75',
    23 => 'D50',
    24 => 'ISO studio tungsten',
    255 => 'Other light source',
    'unknown' => 'Unknown light source (%1$s)',
];
$txt['lgal_exif_flash'] = [
    0 => 'Flash did not fire',
    1 => 'Flash fired',
    5 => 'Strobe return light not detected',
    7 => 'Strobe return light detected',
    9 => 'Flash fired, compulsory flash mode',
    13 => 'Flash fired, compulsory flash mode, return light not detected',
    15 => 'Flash fired, compulsory flash mode, return light detected',
    16 => 'Flash did not fire, compulsory flash suppression mode',
    24 => 'Flash did not fire, auto mode',
    25 => 'Flash fired, auto mode',
    29 => 'Flash fired, auto mode, return light not detected',
    31 => 'Flash fired, auto mode, return light detected',
    32 => 'No flash function',
    65 => 'Flash fired, red-eye reduction mode',
    69 => 'Flash fired, red-eye reduction mode, return light not detected',
    71 => 'Flash fired, red-eye reduction mode, return light detected',
    73 => 'Flash fired, compulsory flash mode, red-eye reduction mode',
    77 => 'Flash fired, compulsory flash mode, red-eye reduction mode, return light not detected',
    79 => 'Flash fired, compulsory flash mode, red-eye reduction mode, return light detected',
    89 => 'Flash fired, auto mode, red-eye reduction mode',
    93 => 'Flash fired, auto mode, return light not detected, red-eye reduction mode',
    95 => 'Flash fired, auto mode, return light detected, red-eye reduction mode',
    'unknown' => 'Unknown flash mode (%1$s)',
];
$txt['lgal_exif_contrast'] = [
    0 => 'Normal contrast',
    1 => 'Soft contrast',
    2 => 'Hard contrast',
    'unknown' => 'Unknown contrast (%1$s)',
];
$txt['lgal_exif_sharpness'] = [
    0 => 'Normal sharpness',
    1 => 'Soft sharpness',
    2 => 'Hard sharpness',
    'unknown' => 'Unknown sharpness (%1$s)',
];
$txt['lgal_exif_colorspace'] = [
    1 => 'RGB',
    65535 => 'Uncalibrated',
    'unknown' => 'Unknown color space (%1$s)',
];
$txt['lgal_exif_resolution'] = [
    '%d x %dpx',
    '%d x %dpx',
    '%d x %dpx (%01.2f x %01.2fin)',
    '%d x %dpx (%01.2f x %01.2fcm)',
];
