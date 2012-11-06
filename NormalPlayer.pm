#!/usr/bin/perl

package NormalPlayer;

use strict;
use OpenGL ':all';
use Readonly;

use base qw(Player CollisionObj);

Readonly my $POSITION_Y		=> 400;		# Y���W�i�Œ�j
Readonly my $WIDTH			=> 30;		# ����
Readonly my $HEIGHT			=> 10;		# �c��
Readonly my $VELOCITY		=> 3;		# ���x

# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	
	# �����o�ϐ�
	my $scene = {};
	$scene->{pos_x} = 230;
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $scene, $this;
	
	return $scene;
}

# �`��
sub draw
{
	my $this = shift;

	glColor3f( 1.0, 1.0, 0.0 );
	glBegin( GL_LINE_LOOP );
	glVertex2f( $this->{pos_x} - 1, $POSITION_Y );
	glVertex2f( $this->{pos_x} + $WIDTH, $POSITION_Y );
	glVertex2f( $this->{pos_x} + $WIDTH, $POSITION_Y + $HEIGHT );
	glVertex2f( $this->{pos_x}, $POSITION_Y + $HEIGHT );
	glEnd();
}

# �X�V
sub update
{
	my $this = shift;
	my $input_manager = shift;

	$this->{pos_x} = $input_manager->get_mouse_pos_x();
	if( $this->{pos_x} > 480 - $WIDTH ){
		$this->{pos_x} = 480 - $WIDTH;
	}
	elsif( $this->{pos_x} < 10 ){
		$this->{pos_x} = 10;
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
	
	return $POSITION_Y;
}

# �����擾����
sub get_width
{
	my $this = shift;
	
	return $WIDTH;
}

# �������擾����
sub get_height
{
	return $HEIGHT;
}

1;