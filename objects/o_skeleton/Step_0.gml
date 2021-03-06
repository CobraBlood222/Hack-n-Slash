
switch (state)
{
	case "move":
		#region Move State
		if input.right
		{
			move_and_collide(run_speed, 0);
			image_xscale= 1;
			sprite_index = s_skeleton_run;
			image_speed = 0.6;
		}

		if input.left and not place_meeting(x - 4, y, o_wall)
		{
			move_and_collide(-run_speed, 0);
			image_xscale = -1;
			sprite_index = s_skeleton_run;
			image_speed = 0.6;
		}

		if not input.right and not input.left{
			sprite_index = s_skeleton_idle;	
			image_speed = 0.4;
		}
	
		if input.roll
		{
			state = "roll";
		}
		
		if input.attack
		{
			state = "attack one";
		}
		#endregion
		break;
	
	case "roll":
		#region Roll State
		set_state_sprite(s_skeleton_roll, 0.7, 0);
	
		if image_xscale == 1
		{
			move_and_collide(roll_speed, 0);
		}
	
		if image_xscale == -1
		{
			move_and_collide(-roll_speed, 0);
		}
		
		if animation_end()
		{
			state = "move"
		}
		#endregion
		break;
	
	case "attack one":
		#region Attack One State
		set_state_sprite(s_skeleton_attack_one, 0.7, 0);
			
		if input.attack and animation_hit_frame_range(2, 4)
		{
			state = "attack two";
		}
		
		if animation_end()
		{
			state = "move";
		}
		#endregion
		break;
	
	case "attack two":
		#region Attack Two State
		set_state_sprite(s_skeleton_attack_two, 0.7, 0);
			
		if input.attack and animation_hit_frame_range(2, 4)
		{
			state = "attack three";
		}
		
		if animation_end()
		{
			state = "move";
		}
		#endregion
		break;
		
	case "attack three":
		#region Attack Three State
		set_state_sprite(s_skeleton_attack_three, 0.7, 0);
		if animation_end()
		{
			state = "move";
		}
		#endregion
		break;
}