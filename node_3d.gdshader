shader_type spatial;
render_mode specular_schlick_ggx;

uniform sampler2D albedo_tex : source_color, repeat_enable;
uniform float tile_scale = 16.0;    // จำนวนไทล์ต่อระนาบ
uniform vec3  tint       = vec3(0.25, 0.40, 0.25); // โทนเขียวหม่น
uniform float darkness   = 0.6;     // 0 = สว่าง, 1 = มืด
uniform float roughness_val = 1.0;  // หญ้าไม่สะท้อน
uniform float ao_val        = 1.0;

void fragment() {
    vec2 uv = UV * tile_scale;
    vec3 base = texture(albedo_tex, uv).rgb;

    // แต่งโทน + ทำให้มืดลง
    base *= tint;
    float d = clamp(darkness, 0.0, 1.0);
    base *= (1.0 - 0.6 * d); // ลดสว่างตาม darkness

    ALBEDO    = base;
    ROUGHNESS = roughness_val;
    AO        = ao_val;
}
