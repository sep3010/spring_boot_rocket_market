package edu.kosmo.krm.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Profile {
	public String nickname;
	public String thumbnail_image_url;
	public String profile_image_url;
	public Boolean is_default_image;
}
