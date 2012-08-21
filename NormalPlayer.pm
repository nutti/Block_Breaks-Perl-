#!/usr/bin/perl

package NormalPlayer;

use strict;
use OpenGL ':all';
use Readonly;

use base qw(Player);

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

	glColor3f( 1.0, 1.0, 0 );
	glBegin( GL_LINE_LOOP );
	glVertex2f( $this->{pos_x}, $POSITION_Y );
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

	if( $input_manager->is_pushed( 122 ) == 1 ){
		$this->{pos_x} += $VELOCITY;
		
	}
}

# X���W���擾����
sub get_pos_x
{
}

# Y���W���擾����
sub get_pos_y
{
}

# �����擾����
sub get_width
{
}

# �������擾����
sub get_height
{
}

1;