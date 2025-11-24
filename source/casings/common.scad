pcb_thickness_mm = 1.8;
shell_thickness_mm = 1.2;
usb_width_mm = 12.5;
usb_thickness_mm = 4.625;
screw_nut_sides = 6;
screw_nut_diameter_mm = 5.1;
screw_head_sides = 64;
screw_head_diameter_mm = 4.5;
screw_thread_sides = 16;
screw_thread_diameter_mm = 2.5;
ext1_diameter_mm = 3.75;
ext2_diameter_mm = 3.5;
cable_pinch_mm = 0.2;
cable_sides = 32;
cable_spacing_mm = 1;
cable_lead_mm = 10;
cable_run_width_mm = 10;
half_spacing_mm = 5;
fudge = 1;
layer_height_mm = 0.2;

difference() {
  union() {
    linear_extrude(shell_thickness_mm + pcb_bottom_clearance_mm + pcb_thickness_mm / 2) {
      difference() {
        union() {
          hull() {
            translate([
              shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
              shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
            ]) {
              circle(d = max(screw_head_diameter_mm, screw_nut_diameter_mm) + shell_thickness_mm * 2, $fn = max(screw_head_sides, screw_nut_sides));
            };

            translate([
              shell_thickness_mm * 3 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 1.5 + pcb_width_mm,
              shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
            ]) {
              circle(d = max(screw_head_diameter_mm, screw_nut_diameter_mm) + shell_thickness_mm * 2, $fn = max(screw_head_sides, screw_nut_sides));
            };
          };

          translate([
            shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm),
            shell_thickness_mm * 2 + max(screw_head_diameter_mm, screw_nut_diameter_mm),
          ]) {
            square([
              pcb_width_mm + shell_thickness_mm * 2,
              pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) * 2 - shell_thickness_mm * 2 + cable_lead_mm,
            ]);
          };

          hull() {
            translate([
              shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
              shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
            ]) {
              circle(d = max(screw_head_diameter_mm, screw_nut_diameter_mm) + shell_thickness_mm * 2, $fn = max(screw_head_sides, screw_nut_sides));
            };

            translate([
              shell_thickness_mm * 3 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 1.5 + pcb_width_mm,
              shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
            ]) {
              circle(d = max(screw_head_diameter_mm, screw_nut_diameter_mm) + shell_thickness_mm * 2, $fn = max(screw_head_sides, screw_nut_sides));
            };
          };
        };

        translate([
          shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
          shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
        ]) {
          circle(d = screw_thread_diameter_mm, $fn = screw_thread_sides);
        };

        translate([
          shell_thickness_mm * 3 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 1.5 + pcb_width_mm,
          shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
        ]) {
          circle(d = screw_thread_diameter_mm, $fn = screw_thread_sides);
        };

        translate([
          shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
          shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
        ]) {
          circle(d = screw_thread_diameter_mm, $fn = screw_thread_sides);
        };

        translate([
          shell_thickness_mm * 3 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 1.5 + pcb_width_mm,
          shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
        ]) {
          circle(d = screw_thread_diameter_mm, $fn = screw_thread_sides);
        };
      };
    };

    linear_extrude(shell_thickness_mm + pcb_top_clearance_mm + pcb_thickness_mm / 2) {
      difference() {
        union() {
          hull() {
            translate([
              shell_thickness_mm * 5 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 2.5 + half_spacing_mm + pcb_width_mm,
              shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
            ]) {
              circle(d = max(screw_head_diameter_mm, screw_nut_diameter_mm) + shell_thickness_mm * 2, $fn = max(screw_head_sides, screw_nut_sides));
            };

            translate([
              shell_thickness_mm * 7 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3.5 + pcb_width_mm * 2 + half_spacing_mm,
              shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
            ]) {
              circle(d = max(screw_head_diameter_mm, screw_nut_diameter_mm) + shell_thickness_mm * 2, $fn = max(screw_head_sides, screw_nut_sides));
            };
          };

          translate([
            shell_thickness_mm * 5 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3 + pcb_width_mm + half_spacing_mm,
            shell_thickness_mm * 2 + max(screw_head_diameter_mm, screw_nut_diameter_mm),
          ]) {
            square([
              pcb_width_mm + shell_thickness_mm * 2,
              pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) * 2 - shell_thickness_mm * 2 + cable_lead_mm,
            ]);
          };

          hull() {
            translate([
              shell_thickness_mm * 5 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 2.5 + half_spacing_mm + pcb_width_mm,
              shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
            ]) {
              circle(d = max(screw_head_diameter_mm, screw_nut_diameter_mm) + shell_thickness_mm * 2, $fn = max(screw_head_sides, screw_nut_sides));
            };

            translate([
              shell_thickness_mm * 7 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3.5 + pcb_width_mm * 2 + half_spacing_mm,
              shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
            ]) {
              circle(d = max(screw_head_diameter_mm, screw_nut_diameter_mm) + shell_thickness_mm * 2, $fn = max(screw_head_sides, screw_nut_sides));
            };
          };
        };

        translate([
          shell_thickness_mm * 5 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 2.5 + pcb_width_mm + half_spacing_mm,
          shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
        ]) {
          circle(d = screw_thread_diameter_mm, $fn = screw_thread_sides);
        };

        translate([
          shell_thickness_mm * 7 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3.5 + pcb_width_mm * 2 + half_spacing_mm,
          shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
        ]) {
          circle(d = screw_thread_diameter_mm, $fn = screw_thread_sides);
        };

        translate([
          shell_thickness_mm * 5 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 2.5 + pcb_width_mm + half_spacing_mm,
          shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
        ]) {
          circle(d = screw_thread_diameter_mm, $fn = screw_thread_sides);
        };

        translate([
          shell_thickness_mm * 7 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3.5 + pcb_width_mm * 2 + half_spacing_mm,
          shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
        ]) {
          circle(d = screw_thread_diameter_mm, $fn = screw_thread_sides);
        };
      };
    };
  };

  linear_extrude(pcb_bottom_clearance_mm + pcb_thickness_mm / 2) {
    translate([
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
    ]) {
      square([screw_thread_diameter_mm, screw_thread_diameter_mm], center = true);
    };

    translate([
      shell_thickness_mm * 3 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 1.5 + pcb_width_mm,
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
    ]) {
      square([screw_thread_diameter_mm, screw_thread_diameter_mm], center = true);
    };

    translate([
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
      shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
    ]) {
      square([screw_thread_diameter_mm, screw_thread_diameter_mm], center = true);
    };

    translate([
      shell_thickness_mm * 3 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 1.5 + pcb_width_mm,
      shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
    ]) {
      square([screw_thread_diameter_mm, screw_thread_diameter_mm], center = true);
    };
  };

  linear_extrude(pcb_top_clearance_mm + pcb_thickness_mm / 2) {
    translate([
      shell_thickness_mm * 5 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 2.5 + pcb_width_mm + half_spacing_mm,
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
    ]) {
      square([screw_thread_diameter_mm, screw_thread_diameter_mm], center = true);
    };

    translate([
      shell_thickness_mm * 7 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3.5 + pcb_width_mm * 2 + half_spacing_mm,
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
    ]) {
      square([screw_thread_diameter_mm, screw_thread_diameter_mm], center = true);
    };

    translate([
      shell_thickness_mm * 5 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 2.5 + pcb_width_mm + half_spacing_mm,
      shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
    ]) {
      square([screw_thread_diameter_mm, screw_thread_diameter_mm], center = true);
    };

    translate([
      shell_thickness_mm * 7 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3.5 + pcb_width_mm * 2 + half_spacing_mm,
      shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
    ]) {
      square([screw_thread_diameter_mm, screw_thread_diameter_mm], center = true);
    };
  };

  linear_extrude(pcb_bottom_clearance_mm + pcb_thickness_mm / 2 - layer_height_mm) {
    translate([
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
    ]) {
      intersection() {
        square([screw_nut_diameter_mm, screw_thread_diameter_mm], center = true);
        circle(d = screw_nut_diameter_mm, $fn = screw_nut_sides);
      };
    };

    translate([
      shell_thickness_mm * 3 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 1.5 + pcb_width_mm,
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
    ]) {
      intersection() {
        square([screw_nut_diameter_mm, screw_thread_diameter_mm], center = true);
        circle(d = screw_nut_diameter_mm, $fn = screw_nut_sides);
      };
    };

    translate([
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
      shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
    ]) {
      intersection() {
        square([screw_nut_diameter_mm, screw_thread_diameter_mm], center = true);
        circle(d = screw_nut_diameter_mm, $fn = screw_nut_sides);
      };
    };

    translate([
      shell_thickness_mm * 3 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 1.5 + pcb_width_mm,
      shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
    ]) {
      intersection() {
        square([screw_nut_diameter_mm, screw_thread_diameter_mm], center = true);
        circle(d = screw_nut_diameter_mm, $fn = screw_nut_sides);
      };
    };
  };

  linear_extrude(pcb_top_clearance_mm + pcb_thickness_mm / 2 - layer_height_mm) {
    translate([
      shell_thickness_mm * 5 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 2.5 + pcb_width_mm + half_spacing_mm,
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
    ]) {
      intersection() {
        square([screw_head_diameter_mm, screw_thread_diameter_mm], center = true);
        circle(d = screw_head_diameter_mm, $fn = screw_head_sides);
      };
    };

    translate([
      shell_thickness_mm * 7 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3.5 + pcb_width_mm * 2 + half_spacing_mm,
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
    ]) {
      intersection() {
        square([screw_head_diameter_mm, screw_thread_diameter_mm], center = true);
        circle(d = screw_head_diameter_mm, $fn = screw_head_sides);
      };
    };

    translate([
      shell_thickness_mm * 5 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 2.5 + pcb_width_mm + half_spacing_mm,
      shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
    ]) {
      intersection() {
        square([screw_head_diameter_mm, screw_thread_diameter_mm], center = true);
        circle(d = screw_head_diameter_mm, $fn = screw_head_sides);
      };
    };

    translate([
      shell_thickness_mm * 7 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3.5 + pcb_width_mm * 2 + half_spacing_mm,
      shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
    ]) {
      intersection() {
        square([screw_head_diameter_mm, screw_thread_diameter_mm], center = true);
        circle(d = screw_head_diameter_mm, $fn = screw_head_sides);
      };
    };
  };

  linear_extrude(pcb_bottom_clearance_mm + pcb_thickness_mm / 2 - layer_height_mm * 2) {
    translate([
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
    ]) {
      circle(d = screw_nut_diameter_mm, $fn = screw_nut_sides);
    };

    translate([
      shell_thickness_mm * 3 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 1.5 + pcb_width_mm,
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
    ]) {
      circle(d = screw_nut_diameter_mm, $fn = screw_nut_sides);
    };

    translate([
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
      shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
    ]) {
      circle(d = screw_nut_diameter_mm, $fn = screw_nut_sides);
    };

    translate([
      shell_thickness_mm * 3 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 1.5 + pcb_width_mm,
      shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
    ]) {
      circle(d = screw_nut_diameter_mm, $fn = screw_nut_sides);
    };
  };

  translate([
    0,
    0,
    shell_thickness_mm,
  ]) {
    linear_extrude(pcb_bottom_clearance_mm) {
      difference() {
        translate([
          shell_thickness_mm * 2 + max(screw_head_diameter_mm, screw_nut_diameter_mm),
          shell_thickness_mm + cable_lead_mm,
        ]) {
          square([pcb_width_mm, pcb_length_mm]);
        };

        translate([
          shell_thickness_mm * 2 + max(screw_head_diameter_mm, screw_nut_diameter_mm),
          shell_thickness_mm + pcb_support_inset_mm + cable_lead_mm,
        ]) {
          square([(pcb_width_mm - cable_run_width_mm) / 2, pcb_support_length_mm]);
        };

        translate([
          shell_thickness_mm * 2 + max(screw_head_diameter_mm, screw_nut_diameter_mm) + pcb_width_mm / 2 + cable_run_width_mm / 2,
          shell_thickness_mm + pcb_support_inset_mm + cable_lead_mm,
        ]) {
          square([(pcb_width_mm - cable_run_width_mm) / 2, pcb_support_length_mm]);
        };
      };
    };

    linear_extrude(pcb_top_clearance_mm) {
      difference() {
        translate([
          shell_thickness_mm * 6 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3 + pcb_width_mm + half_spacing_mm,
          shell_thickness_mm + cable_lead_mm,
        ]) {
          square([pcb_width_mm, pcb_length_mm]);
        };

        translate([
          shell_thickness_mm * 6 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3 + pcb_width_mm + half_spacing_mm,
          shell_thickness_mm + pcb_support_inset_mm + cable_lead_mm,
        ]) {
          square([pcb_width_mm / 2 - cable_run_width_mm / 2, pcb_support_length_mm]);
        };

        translate([
          shell_thickness_mm * 6 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3 + pcb_width_mm + half_spacing_mm + pcb_width_mm / 2 + cable_run_width_mm / 2,
          shell_thickness_mm + pcb_support_inset_mm + cable_lead_mm,
        ]) {
          square([pcb_width_mm / 2 - cable_run_width_mm / 2, pcb_support_length_mm]);
        };
      };
    };
  };

  translate([
    shell_thickness_mm * 2 + max(screw_head_diameter_mm, screw_nut_diameter_mm) + pcb_width_mm / 2 - cable_run_width_mm / 2,
    shell_thickness_mm,
    shell_thickness_mm,
  ]) {
    cube([
    cable_run_width_mm,
    cable_lead_mm,
    pcb_bottom_clearance_mm + pcb_thickness_mm / 2 + fudge,
    ]);
  };

  translate([
    shell_thickness_mm * 6 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3 + pcb_width_mm * 1.5 - cable_run_width_mm / 2 + half_spacing_mm,
    shell_thickness_mm,
    shell_thickness_mm,
  ]) {
    cube([
    cable_run_width_mm,
    cable_lead_mm,
    pcb_top_clearance_mm + pcb_thickness_mm / 2 + fudge,
    ]);
  };

  translate([
    0,
    0,
    shell_thickness_mm + pcb_bottom_clearance_mm,
  ]) {
    linear_extrude(pcb_thickness_mm / 2) {
      translate([
        shell_thickness_mm * 2 + max(screw_head_diameter_mm, screw_nut_diameter_mm),
        shell_thickness_mm + cable_lead_mm,
      ]) {
        square([pcb_width_mm, pcb_length_mm]);
      };

      translate([
        shell_thickness_mm * 2 + max(screw_head_diameter_mm, screw_nut_diameter_mm) + pcb_width_mm / 2 - usb_width_mm / 2,
        shell_thickness_mm + pcb_length_mm + cable_lead_mm,
      ]) {
        square([usb_width_mm, shell_thickness_mm]);
      };
    };
  };

  linear_extrude(pcb_top_clearance_mm + pcb_thickness_mm / 2 - layer_height_mm * 2) {
    translate([
      shell_thickness_mm * 5 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 2.5 + pcb_width_mm + half_spacing_mm,
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
    ]) {
      circle(d = screw_head_diameter_mm, $fn = screw_head_sides);
    };

    translate([
      shell_thickness_mm * 7 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3.5 + pcb_width_mm * 2 + half_spacing_mm,
      shell_thickness_mm + max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2,
    ]) {
      circle(d = screw_head_diameter_mm, $fn = screw_head_sides);
    };

    translate([
      shell_thickness_mm * 5 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 2.5 + pcb_width_mm + half_spacing_mm,
      shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
    ]) {
      circle(d = screw_head_diameter_mm, $fn = screw_head_sides);
    };

    translate([
      shell_thickness_mm * 7 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3.5 + pcb_width_mm * 2 + half_spacing_mm,
      shell_thickness_mm + pcb_length_mm - max(screw_head_diameter_mm, screw_nut_diameter_mm) / 2 + cable_lead_mm,
    ]) {
      circle(d = screw_head_diameter_mm, $fn = screw_head_sides);
    };
  };

  translate([
    shell_thickness_mm * 6 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3 + pcb_width_mm + half_spacing_mm,
    shell_thickness_mm + cable_lead_mm,
    shell_thickness_mm + pcb_top_clearance_mm,
  ]) {
    cube([pcb_width_mm, pcb_length_mm, pcb_thickness_mm / 2 + fudge]);
  };

  translate([
    shell_thickness_mm * 6 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3 + pcb_width_mm * 1.5 + half_spacing_mm - usb_width_mm / 2,
    shell_thickness_mm + pcb_length_mm - fudge / 2 + cable_lead_mm,
    shell_thickness_mm + pcb_top_clearance_mm + pcb_thickness_mm - usb_thickness_mm,
  ]) {
    cube([usb_width_mm, shell_thickness_mm + fudge, usb_thickness_mm - pcb_thickness_mm / 2 + fudge]);
  };

  rotate([-90, 0, 0]) {
    linear_extrude(shell_thickness_mm) {
      translate([
        shell_thickness_mm * 2 + max(screw_head_diameter_mm, screw_nut_diameter_mm) + pcb_width_mm / 2 - (cable_spacing_mm + ext2_diameter_mm) / 2,
        -(shell_thickness_mm + pcb_bottom_clearance_mm + pcb_thickness_mm / 2)
      ]) {
        intersection() {
          circle(d = ext1_diameter_mm, $fn = cable_sides);
          square([ext1_diameter_mm, ext1_diameter_mm - cable_pinch_mm * 2], center = true);
        };
      };

      translate([
        shell_thickness_mm * 2 + max(screw_head_diameter_mm, screw_nut_diameter_mm) + pcb_width_mm / 2 + (cable_spacing_mm + ext1_diameter_mm) / 2,
        -(shell_thickness_mm + pcb_bottom_clearance_mm + pcb_thickness_mm / 2)
      ]) {
        intersection() {
          circle(d = ext2_diameter_mm, $fn = cable_sides);
          square([ext2_diameter_mm, ext2_diameter_mm - cable_pinch_mm * 2], center = true);
        };
      };

      translate([
        shell_thickness_mm * 6 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3 + pcb_width_mm * 1.5 + (ext1_diameter_mm + cable_spacing_mm + ext2_diameter_mm) / -2 + ext2_diameter_mm / 2 + half_spacing_mm,
        -(shell_thickness_mm + pcb_top_clearance_mm + pcb_thickness_mm / 2)
      ]) {
        intersection() {
          circle(d = ext2_diameter_mm, $fn = cable_sides);
          square([ext2_diameter_mm, ext2_diameter_mm - cable_pinch_mm * 2], center = true);
        };
      };

      translate([
        shell_thickness_mm * 6 + max(screw_head_diameter_mm, screw_nut_diameter_mm) * 3 + pcb_width_mm * 1.5 + (ext1_diameter_mm + cable_spacing_mm + ext2_diameter_mm) / 2 - ext1_diameter_mm / 2 + half_spacing_mm,
        -(shell_thickness_mm + pcb_top_clearance_mm + pcb_thickness_mm / 2)
      ]) {
        intersection() {
          circle(d = ext1_diameter_mm, $fn = cable_sides);
          square([ext1_diameter_mm, ext1_diameter_mm - cable_pinch_mm * 2], center = true);
        };
      };
    };
  };
};
