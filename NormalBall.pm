#!/usr/bin/perl

package NormalBall;

use strict;
use OpenGL ':all';
use Readonly;
use Util;

use Player;

use base qw(Ball CollisionObj);

Readonly our $BALL_WIDTH		=> 5;
Readonly our $BALL_HEIGHT		=> 5;

# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	
	# �����o�ϐ�
	my $normal_ball = {};
	$normal_ball->{pos_x} = 200;
	$normal_ball->{pos_y} = 200;
	$normal_ball->{vel_x} = 1.0;
	$normal_ball->{vel_y} = -1.0;
	$normal_ball->{attached} = $Util::TRUE;
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $normal_ball, $this;
	
	return $normal_ball;
}

# �`��
sub draw
{
	my $this = shift;
	
	glColor3f( 1.0, 1.0, 1.0 );
	glBegin( GL_LINE_LOOP );
	glVertex2f( $this->{pos_x} - 1, $this->{pos_y} );
	glVertex2f( $this->{pos_x} + $BALL_WIDTH, $this->{pos_y} );
	glVertex2f( $this->{pos_x} + $BALL_WIDTH, $this->{pos_y} + $BALL_HEIGHT );
	glVertex2f( $this->{pos_x}, $this->{pos_y} + $BALL_HEIGHT );
	glEnd();
}

# �X�V
sub update
{
	my $this = shift;
	my $player = shift;
	my $input_manager = shift;
	
	if( $input_manager->is_mouse_left_clicked() ){
		$this->{attached} = $Util::FALSE;
	}
	
	if( !$this->{attached} ){
		$this->{pos_x} += $this->{vel_x};
		$this->{pos_y} += $this->{vel_y};
		if( $this->{pos_x} > 480 - $BALL_WIDTH ){
			$this->{vel_x} = -1.0;
		}
		elsif( $this->{pos_x} < 10 ){
			$this->{vel_x} = 1.0;
		}
		if( $this->{pos_y} < 10 ){
			$this->{vel_y} = 1.0;
		}
		elsif( $this->{pos_y} > 460 ){
			$this->{vel_x} = 1.0;
			$this->{vel_y} = -1.0;
			$this->{attached} = $Util::TRUE;
		}
	}
	else{
		$this->{pos_x} = $player->get_pos_x() + 15;
		$this->{pos_y} = $player->get_pos_y() - 5;
	}
}

# X���W���擾����
sub get_pos_x
{
	my $this = shift;
	
	return $this->{pos_x};
}

# Y���W���擾����
sub get_pos_y
{
	my $this = shift;
	
	return $this->{pos_y};
}

# �����擾����
sub get_width
{
	my $this = shift;
	
	return $BALL_WIDTH;
}

# �������擾����
sub get_height
{
	my $this = shift;
	
	return $BALL_HEIGHT;
}

# �v���C���[�Ƃ̏Փ�
sub process_collision_with_player
{
	my $this = shift;
	
	$this->{vel_y} = -$this->{vel_y};
}

# �u���b�N�Ƃ̏Փ�
sub process_collision_with_block
{
	my $this = shift;
	my $side = shift;
	
	if( ( $side & $CollisionObj::INTERSECT_TOP ) && ( $side & $CollisionObj::INTERSECT_BOTTOM ) ){
		$this->{vel_y} = $this->{vel_y};
	}
	elsif( ( $side & $CollisionObj::INTERSECT_TOP ) || ( $side & $CollisionObj::INTERSECT_BOTTOM ) ){
		$this->{vel_y} = -$this->{vel_y}
	}
	if( ( $side & $CollisionObj::INTERSECT_RIGHT ) && ( $side & $CollisionObj::INTERSECT_LEFT ) ){
		$this->{vel_x} = $this->{vel_x};
	}
	elsif( ( $side & $CollisionObj::INTERSECT_RIGHT ) || ( $side & $CollisionObj::INTERSECT_LEFT ) ){
		$this->{vel_x} = -$this->{vel_x};
	}
}

1;