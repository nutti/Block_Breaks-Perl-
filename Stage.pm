#!/usr/bin/perl

package Stage;

use strict;
use OpenGL ':all';

use base qw(Scene);
use NormalPlayer;
use NormalBall;
use BlockGroup;

# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	
	# �����o�ϐ�
	my $stage = {};
	$stage->{player} = new NormalPlayer;
	$stage->{ball} = new NormalBall;
	$stage->{block_group} = new BlockGroup( 'stage1.dat' );
	$stage->{score} = 0;
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $stage, $this;
	
	return $stage;
}

sub draw
{
	my $this = shift;
	
	$this->{player}->draw();
	$this->{ball}->draw();
	$this->{block_group}->draw();
	
	glColor3f( 1.0, 1.0, 1.0 );
	glBegin( GL_LINE_LOOP );
	glVertex2f( 10, 10 );
	glVertex2f( 480, 10 );
	glVertex2f( 480, 500 );
	glVertex2f( 10, 500 );
	glEnd();
	
	my $score = $this->{score};
	for( my $i = 0; $score != 0; --$i ){
		glRasterPos2f( 600.0 + $i * 18, 100.0 );
		glutBitmapCharacter( GLUT_BITMAP_HELVETICA_18, ord ( $score % 10 ) );
		$score = int( $score / 10 );
	}
}

sub update
{
	my $this = shift;
	my $input_manager = shift;
	
	$this->{player}->update( $input_manager );
	$this->{ball}->update();
	if( $this->{ball}->is_collided( $this->{player} ) ){
		$this->{ball}->process_collision_with_player();
	}
	$this->{block_group}->collision( $this->{ball}, \$this->{score} );
}

# ���̃V�[���Ɉڍs
sub set_next_scene
{
	
}

1;