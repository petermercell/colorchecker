set cut_paste_input [stack 0]
version 15.1 v5
push $cut_paste_input
Expression {
 temp_name0 tetra
 temp_expr0 "(  (b>g) ? r*(wht.r-cyn.r) + g*(cyn.r-blu.r) + b*(blu.r-blk.r)+blk.r : ( (b>r) ? r*(wht.r-cyn.r) + g*(grn.r-blk.r)+blk.r + b*(cyn.r-grn.r) : r*(yel.r-grn.r) + g*(grn.r-blk.r)+blk.r + b*(wht.r-yel.r) ) )\n"
 temp_name1 tetra02
 temp_expr1 "(  (b>g) ? r*(wht.g-cyn.g) + g*(cyn.g-blu.g) + b*(blu.g-blk.g)+blk.g : ( (b>r) ? r*(wht.g-cyn.g) + g*(grn.g-blk.g)+blk.g + b*(cyn.g-grn.g) : r*(yel.g-grn.g) + g*(grn.g-blk.g)+blk.g + b*(wht.g-yel.g) ) )\n"
 temp_name2 tetra03
 temp_expr2 "(  (b>g) ? r*(wht.b-cyn.b) + g*(cyn.b-blu.b) + b*(blu.b-blk.b)+blk.b : ( (b>r) ? r*(wht.b-cyn.b) + g*(grn.b-blk.b)+blk.b + b*(cyn.b-grn.b) : r*(yel.b-grn.b) + g*(grn.b-blk.b)+blk.b + b*(wht.b-yel.b) ) )"
 expr0 "(r>g) ? ( (g>b) ? r*(red.r-blk.r)+blk.r + g*(yel.r-red.r) + b*(wht.r-yel.r) : ( (r>b) ? r*(red.r-blk.r)+blk.r + g*(wht.r-mag.r) + b*(mag.r-red.r) : r*(mag.r-blu.r) + g*(wht.r-mag.r) + b*(blu.r-blk.r)+blk.r ) ) : tetra\n"
 expr1 "(r>g) ? ( (g>b) ? r*(red.g-blk.g)+blk.g + g*(yel.g-red.g) + b*(wht.g-yel.g) : ( (r>b) ? r*(red.g-blk.g)+blk.g + g*(wht.g-mag.g) + b*(mag.g-red.g) : r*(mag.g-blu.g) + g*(wht.g-mag.g) + b*(blu.g-blk.g)+blk.g ) ) : tetra02\n"
 expr2 "(r>g) ? ( (g>b) ? r*(red.b-blk.b)+blk.b + g*(yel.b-red.b) + b*(wht.b-yel.b) : ( (r>b) ? r*(red.b-blk.b)+blk.b + g*(wht.b-mag.b) + b*(mag.b-red.b) : r*(mag.b-blu.b) + g*(wht.b-mag.b) + b*(blu.b-blk.b)+blk.b ) ) : tetra03\n"
 name TetraInterp_Expression_
 selected true
 xpos 4028
 ypos -1529
 addUserKnob {20 User}
 addUserKnob {18 blk l Black}
 blk {0 0 0}
 addUserKnob {6 blk_panelDropped l "panel dropped state" -STARTLINE +HIDDEN}
 addUserKnob {6 color_rgb_panelDropped l "panel dropped state" -STARTLINE +HIDDEN}
 addUserKnob {18 wht l White}
 wht {1 1 1}
 addUserKnob {6 wht_panelDropped l "panel dropped state" -STARTLINE +HIDDEN}
 addUserKnob {6 color_rgb_1_panelDropped l "panel dropped state" -STARTLINE +HIDDEN}
 addUserKnob {26 ""}
 addUserKnob {18 red l Red}
 red {1 0 0}
 addUserKnob {6 red_panelDropped l "panel dropped state" -STARTLINE +HIDDEN}
 addUserKnob {18 grn l Green}
 grn {0 1 0}
 addUserKnob {6 grn_panelDropped l "panel dropped state" -STARTLINE +HIDDEN}
 addUserKnob {18 blu l Blue}
 blu {0 0 1}
 addUserKnob {6 blu_panelDropped l "panel dropped state" -STARTLINE +HIDDEN}
 addUserKnob {6 color_rgb_2_panelDropped l "panel dropped state" -STARTLINE +HIDDEN}
 addUserKnob {18 cyn l Cyan}
 cyn {0 1 1}
 addUserKnob {6 cyn_panelDropped l "panel dropped state" -STARTLINE +HIDDEN}
 addUserKnob {6 color_rgb_3_panelDropped l "panel dropped state" -STARTLINE +HIDDEN}
 addUserKnob {18 mag l Magenta}
 mag {1 0 1}
 addUserKnob {6 mag_panelDropped l "panel dropped state" -STARTLINE +HIDDEN}
 addUserKnob {6 color_rgb_4_panelDropped l "panel dropped state" -STARTLINE +HIDDEN}
 addUserKnob {18 yel l Yellow}
 yel {1 1 0}
 addUserKnob {6 yel_panelDropped l "panel dropped state" -STARTLINE +HIDDEN}
 addUserKnob {6 color_rgb_5_panelDropped l "panel dropped state" -STARTLINE +HIDDEN}
 addUserKnob {20 info}
 addUserKnob {26 info_1 l "" +STARTLINE T "<style> a:link \{ color: #ccc \}</style>\n<font color=#ccc><br>\n<b>Tetrahedral Interpolation</b> <br>\ncolor transformations using tetrahedral math.\n<br>\n<p>Written by <a href=https://github.com/calvinsilly>silly calvin</a>\n</p>"}
}
