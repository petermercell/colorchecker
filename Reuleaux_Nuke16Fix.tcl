set cut_paste_input [stack 0]
version 16.0 v1
push $cut_paste_input
Group {
 name Reuleaux1
 selected true
 xpos 2247
 ypos -774
 addUserKnob {20 User l Reuleaux}
 addUserKnob {26 ""}
 addUserKnob {41 "ReuleauxUser_Red Hue" l "Red Hue" T "ReuleauxUser5.ReuleauxUser_Red Hue"}
 addUserKnob {41 "ReuleauxUser_Red Saturation" l "Red Saturation" T "ReuleauxUser5.ReuleauxUser_Red Saturation"}
 addUserKnob {41 "ReuleauxUser_Red Value" l "Red Value" T "ReuleauxUser5.ReuleauxUser_Red Value"}
 addUserKnob {26 ""}
 addUserKnob {41 "ReuleauxUser_Green Hue" l "Green Hue" T "ReuleauxUser5.ReuleauxUser_Green Hue"}
 addUserKnob {41 "ReuleauxUser_Green Saturation" l "Green Saturation" T "ReuleauxUser5.ReuleauxUser_Green Saturation"}
 addUserKnob {41 "ReuleauxUser_Green Value" l "Green Value" T "ReuleauxUser5.ReuleauxUser_Green Value"}
 addUserKnob {26 ""}
 addUserKnob {41 "ReuleauxUser_Blue Hue" l "Blue Hue" T "ReuleauxUser5.ReuleauxUser_Blue Hue"}
 addUserKnob {41 "ReuleauxUser_Blue Saturation" l "Blue Saturation" T "ReuleauxUser5.ReuleauxUser_Blue Saturation"}
 addUserKnob {41 "ReuleauxUser_Blue Value" l "Blue Value" T "ReuleauxUser5.ReuleauxUser_Blue Value"}
 addUserKnob {26 ""}
 addUserKnob {41 "ReuleauxUser_Yellow Hue" l "Yellow Hue" T "ReuleauxUser5.ReuleauxUser_Yellow Hue"}
 addUserKnob {41 "ReuleauxUser_Yellow Saturation" l "Yellow Saturation" T "ReuleauxUser5.ReuleauxUser_Yellow Saturation"}
 addUserKnob {41 "ReuleauxUser_Yellow Value" l "Yellow Value" T "ReuleauxUser5.ReuleauxUser_Yellow Value"}
 addUserKnob {26 ""}
 addUserKnob {41 "ReuleauxUser_Cyan Hue" l "Cyan Hue" T "ReuleauxUser5.ReuleauxUser_Cyan Hue"}
 addUserKnob {41 "ReuleauxUser_Cyan Saturation" l "Cyan Saturation" T "ReuleauxUser5.ReuleauxUser_Cyan Saturation"}
 addUserKnob {41 "ReuleauxUser_Cyan Value" l "Cyan Value" T "ReuleauxUser5.ReuleauxUser_Cyan Value"}
 addUserKnob {26 ""}
 addUserKnob {41 "ReuleauxUser_Magenta Hue" l "Magenta Hue" T "ReuleauxUser5.ReuleauxUser_Magenta Hue"}
 addUserKnob {41 "ReuleauxUser_Magenta Saturation" l "Magenta Saturation" T "ReuleauxUser5.ReuleauxUser_Magenta Saturation"}
 addUserKnob {41 "ReuleauxUser_Magenta Value" l "Magenta Value" T "ReuleauxUser5.ReuleauxUser_Magenta Value"}
 addUserKnob {26 ""}
 addUserKnob {41 "ReuleauxUser_Overall Saturation" l "Overall Saturation" T "ReuleauxUser5.ReuleauxUser_Overall Saturation"}
 addUserKnob {41 "ReuleauxUser_Overall Value" l "Overall Value" T "ReuleauxUser5.ReuleauxUser_Overall Value"}
 addUserKnob {26 ""}
 addUserKnob {41 ReuleauxUser_Invert l Invert T ReuleauxUser5.ReuleauxUser_Invert}
 addUserKnob {26 ""}
}
 Input {
  inputs 0
  name Input1
  xpos -348
  ypos 81
 }
 Group {
  name Reuleaux5
  label "\[value direction]"
  xpos -348
  ypos 123
  addUserKnob {20 User}
  addUserKnob {4 direction M {forward inverse}}
 }
  Input {
   inputs 0
   name Input
   xpos -40
   ypos -9
  }
set Na8a3000 [stack 0]
  Multiply {
   value {{2*pi} {sqrt(2)} 1 1}
   name Denormalize
   xpos 70
   ypos 81
  }
  Expression {
   temp_name0 M
   temp_expr0 "sqrt(2)*max(cos(r), cos(r + 2*pi/3), cos(r - 2*pi/3)) + 1/g"
   temp_name1 u
   temp_expr1 b*cos(r)/M
   temp_name2 v
   temp_expr2 b*sin(r)/M
   temp_name3 w_t
   temp_expr3 b
   expr0 "w_t - sqrt(3/2)*max(abs(v) - sqrt(3)*u, 0)"
   expr1 "w_t - sqrt(3/2)*(max(abs(v), sqrt(3)*u) - v)"
   expr2 "w_t - sqrt(3/2)*(max(abs(v), sqrt(3)*u) + v)"
   name Reuleaux_to_RGB
   xpos 70
   ypos 135
  }
push $Na8a3000
  Expression {
   temp_name0 u
   temp_expr0 sqrt(2)/6*(2*r-g-b)
   temp_name1 v
   temp_expr1 (g-b)/sqrt(6)
   temp_name2 w
   temp_expr2 (r+g+b)/3
   expr0 pi-atan2(v,-u)
   expr1 "w == 0 ? 0 : hypot(u,v)/w"
   expr2 max(r,g,b)
   name RGB_to_Reuleaux
   xpos -150
   ypos 87
  }
  Multiply {
   value {{1/(2*pi)} {1/sqrt(2)} 1 1}
   name Normalize
   xpos -150
   ypos 129
  }
  Switch {
   inputs 2
   which {{parent.direction}}
   name Inverse
   xpos -40
   ypos 255
  }
  Output {
   name Output1
   xpos -40
   ypos 303
  }
  StickyNote {
   inputs 0
   name StickyNote1
   label "https://github.com/hotgluebanjo\nhttps://github.com/calvinsilly"
   xpos 126
   ypos -15
  }
 end_group
 BlinkScript {
  recompileCount 3
  ProgramGroup 1
  KernelDescription "3 \"ReuleauxUser\" iterate pixelWise 4e72b6444ef63082487fac50cf930ce3d3586b7e530e010c5fa56ce8ee6df554 2 \"src\" Read Point \"dst\" Write Point 21 \"Overall Saturation\" Float 1 AACAPw== \"Overall Value\" Float 1 AAAAAA== \"Red Hue\" Float 1 AAAAAA== \"Red Saturation\" Float 1 AACAPw== \"Red Value\" Float 1 AAAAAA== \"Yellow Hue\" Float 1 AAAAAA== \"Yellow Saturation\" Float 1 AACAPw== \"Yellow Value\" Float 1 AAAAAA== \"Green Hue\" Float 1 AAAAAA== \"Green Saturation\" Float 1 AACAPw== \"Green Value\" Float 1 AAAAAA== \"Cyan Hue\" Float 1 AAAAAA== \"Cyan Saturation\" Float 1 AACAPw== \"Cyan Value\" Float 1 AAAAAA== \"Blue Hue\" Float 1 AAAAAA== \"Blue Saturation\" Float 1 AACAPw== \"Blue Value\" Float 1 AAAAAA== \"Magenta Hue\" Float 1 AAAAAA== \"Magenta Saturation\" Float 1 AACAPw== \"Magenta Value\" Float 1 AAAAAA== \"Invert\" Bool 1 AA== 21 \"overall_sat\" 1 1 Default \"overall_val\" 1 1 Default \"red_hue\" 1 1 Default \"red_sat\" 1 1 Default \"red_val\" 1 1 Default \"yel_hue\" 1 1 Default \"yel_sat\" 1 1 Default \"yel_val\" 1 1 Default \"grn_hue\" 1 1 Default \"grn_sat\" 1 1 Default \"grn_val\" 1 1 Default \"cyn_hue\" 1 1 Default \"cyn_sat\" 1 1 Default \"cyn_val\" 1 1 Default \"blu_hue\" 1 1 Default \"blu_sat\" 1 1 Default \"blu_val\" 1 1 Default \"mag_hue\" 1 1 Default \"mag_sat\" 1 1 Default \"mag_val\" 1 1 Default \"invert\" 1 1 Default 0"
  kernelSource "// https://github.com/hotgluebanjo\n// https://github.com/calvinsilly\n\n// 6 hue, 1 wrap, 2 anchor.\n#define N_POINTS 9\n\n#define EPS 1e-6f\n\ninline float spow(float x, float p) \{\n    if (x < 0.0f) \{\n        return -pow(-x, p);\n    \}\n    return pow(x, p);\n\}\n\nfloat interp_linear(float2 *pts, int n_pts, float x) \{\n    if (x <= pts\[0].x) \{\n        return pts\[0].y;\n    \}\n\n    if (x >= pts\[n_pts - 1].x) \{\n        return pts\[n_pts - 1].y;\n    \}\n\n    int i = 0;\n    int upper = n_pts - 1;\n    while (i != upper - 1) \{\n        int m = i + (upper - i) / 2;\n        if (x >= pts\[m].x) \{\n            i = m;\n        \} else \{\n            upper = m;\n        \}\n    \}\n\n    float t = (x - pts\[i].x) / (pts\[i + 1].x - pts\[i].x);\n    return ((1.0f - t) * pts\[i].y + t * pts\[i + 1].y);\n\n\}\n\nkernel ReuleauxUser : ImageComputationKernel<ePixelWise> \{\n    Image<eRead, eAccessPoint, eEdgeClamped> src;\n    Image<eWrite> dst;\n\n    param:\n        float overall_sat;\n        float overall_val;\n\n        float red_hue;\n        float red_sat;\n        float red_val;\n\n        float yel_hue;\n        float yel_sat;\n        float yel_val;\n\n        float grn_hue;\n        float grn_sat;\n        float grn_val;\n\n        float cyn_hue;\n        float cyn_sat;\n        float cyn_val;\n\n        float blu_hue;\n        float blu_sat;\n        float blu_val;\n\n        float mag_hue;\n        float mag_sat;\n        float mag_val;\n\n        bool invert;\n\n    void define() \{\n        defineParam(overall_sat, \"Overall Saturation\", 1.0f);\n        defineParam(overall_val, \"Overall Value\", 0.0f);\n\n        defineParam(red_hue, \"Red Hue\", 0.0f);\n        defineParam(yel_hue, \"Yellow Hue\", 0.0f);\n        defineParam(grn_hue, \"Green Hue\", 0.0f);\n        defineParam(cyn_hue, \"Cyan Hue\", 0.0f);\n        defineParam(blu_hue, \"Blue Hue\", 0.0f);\n        defineParam(mag_hue, \"Magenta Hue\", 0.0f);\n\n        defineParam(red_sat, \"Red Saturation\", 1.0f);\n        defineParam(yel_sat, \"Yellow Saturation\", 1.0f);\n        defineParam(grn_sat, \"Green Saturation\", 1.0f);\n        defineParam(cyn_sat, \"Cyan Saturation\", 1.0f);\n        defineParam(blu_sat, \"Blue Saturation\", 1.0f);\n        defineParam(mag_sat, \"Magenta Saturation\", 1.0f);\n\n        defineParam(red_val, \"Red Value\", 0.0f);\n        defineParam(yel_val, \"Yellow Value\", 0.0f);\n        defineParam(grn_val, \"Green Value\", 0.0f);\n        defineParam(cyn_val, \"Cyan Value\", 0.0f);\n        defineParam(blu_val, \"Blue Value\", 0.0f);\n        defineParam(mag_val, \"Magenta Value\", 0.0f);\n\n        defineParam(invert, \"Invert\", false);\n    \}\n\n    void process() \{\n        // `init` doesn't work with procedures that take pointers.\n        // It's worth making `process` messier for the sake of simplifying\n        // the rest of the code and matching the DCTL.\n\n        SampleType(src) hsv = src();\n\n        float hue = hsv.x;\n        float sat = hsv.y;\n        float val = hsv.z;\n\n        float2 hue_curve\[N_POINTS] = \{\n            \{5.0f / 6.0f - 1.0f, mag_hue + 5.0f / 6.0f - 1.0f\},\n            \{0.0f,               red_hue\},\n            \{1.0f / 6.0f,        yel_hue + 1.0f / 6.0f\},\n            \{2.0f / 6.0f,        grn_hue + 2.0f / 6.0f\},\n            \{3.0f / 6.0f,        cyn_hue + 3.0f / 6.0f\},\n            \{4.0f / 6.0f,        blu_hue + 4.0f / 6.0f\},\n            \{5.0f / 6.0f,        mag_hue + 5.0f / 6.0f\},\n            \{1.0f,               red_hue + 1.0f\},\n            \{1.0f / 6.0f + 1.0f, yel_hue + 1.0f / 6.0f + 1.0f\}\n        \};\n\n        if (invert) \{\n            for (int i = 0; i < N_POINTS; i += 1) \{\n                hue_curve\[i] = float2(hue_curve\[i].y, hue_curve\[i].x);\n            \}\n        \}\n\n        float2 sat_curve\[N_POINTS] = \{\n            \{5.0f / 6.0f - 1.0f, mag_sat\},\n            \{0.0f,               red_sat\},\n            \{1.0f / 6.0f,        yel_sat\},\n            \{2.0f / 6.0f,        grn_sat\},\n            \{3.0f / 6.0f,        cyn_sat\},\n            \{4.0f / 6.0f,        blu_sat\},\n            \{5.0f / 6.0f,        mag_sat\},\n            \{1.0f,               red_sat\},\n            \{1.0f / 6.0f + 1.0f, yel_sat\}\n        \};\n\n        float2 val_curve\[N_POINTS] = \{\n            \{5.0f / 6.0f - 1.0f, mag_val\},\n            \{0.0f,               red_val\},\n            \{1.0f / 6.0f,        yel_val\},\n            \{2.0f / 6.0f,        grn_val\},\n            \{3.0f / 6.0f,        cyn_val\},\n            \{4.0f / 6.0f,        blu_val\},\n            \{5.0f / 6.0f,        mag_val\},\n            \{1.0f,               red_val\},\n            \{1.0f / 6.0f + 1.0f, yel_val\}\n        \};\n\n        float hue_result = interp_linear(hue_curve, N_POINTS, hue);\n        float hue_switch = invert ? hue : hue_result;\n\n        float sat_factor = interp_linear(sat_curve, N_POINTS, hue_switch) * overall_sat;\n        float val_factor = interp_linear(val_curve, N_POINTS, hue_switch) + overall_val;\n\n        if (!invert) \{\n            sat_factor = 1.0f / sat_factor;\n        \}\n\n        float sat_result = spow(sat, sat_factor);\n        float sat_switch = invert ? sat : sat_result;\n\n        val_factor = max(1.0f + sat_switch * val_factor, EPS);\n        float val_result;\n\n        if (invert) \{\n            val_result = val / val_factor;\n        \} else \{\n            val_result = val * val_factor;\n        \}\n\n        dst() = float4(hue_result, sat_result, val_result, hsv.w);\n    \}\n\};"
  rebuild ""
  rebuild_finalise ""
  name ReuleauxUser5
  xpos -348
  ypos 174
 }
 Group {
  name Reuleaux6
  label "\[value direction]"
  xpos -348
  ypos 234
  addUserKnob {20 User}
  addUserKnob {4 direction M {forward inverse}}
  direction inverse
 }
  Input {
   inputs 0
   name Input
   xpos -40
   ypos -9
  }
set N95342c00 [stack 0]
  Multiply {
   value {{2*pi} {sqrt(2)} 1 1}
   name Denormalize
   xpos 70
   ypos 81
  }
  Expression {
   temp_name0 M
   temp_expr0 "sqrt(2)*max(cos(r), cos(r + 2*pi/3), cos(r - 2*pi/3)) + 1/g"
   temp_name1 u
   temp_expr1 b*cos(r)/M
   temp_name2 v
   temp_expr2 b*sin(r)/M
   temp_name3 w_t
   temp_expr3 b
   expr0 "w_t - sqrt(3/2)*max(abs(v) - sqrt(3)*u, 0)"
   expr1 "w_t - sqrt(3/2)*(max(abs(v), sqrt(3)*u) - v)"
   expr2 "w_t - sqrt(3/2)*(max(abs(v), sqrt(3)*u) + v)"
   name Reuleaux_to_RGB
   xpos 70
   ypos 135
  }
push $N95342c00
  Expression {
   temp_name0 u
   temp_expr0 sqrt(2)/6*(2*r-g-b)
   temp_name1 v
   temp_expr1 (g-b)/sqrt(6)
   temp_name2 w
   temp_expr2 (r+g+b)/3
   expr0 pi-atan2(v,-u)
   expr1 "w == 0 ? 0 : hypot(u,v)/w"
   expr2 max(r,g,b)
   name RGB_to_Reuleaux
   xpos -150
   ypos 87
  }
  Multiply {
   value {{1/(2*pi)} {1/sqrt(2)} 1 1}
   name Normalize
   xpos -150
   ypos 129
  }
  Switch {
   inputs 2
   which {{parent.direction}}
   name Inverse
   xpos -40
   ypos 255
  }
  Output {
   name Output1
   xpos -40
   ypos 303
  }
  StickyNote {
   inputs 0
   name StickyNote1
   label "https://github.com/hotgluebanjo\nhttps://github.com/calvinsilly"
   xpos 126
   ypos -15
  }
 end_group
 Output {
  name Output1
  xpos -348
  ypos 290
 }
end_group
