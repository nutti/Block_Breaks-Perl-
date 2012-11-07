#!/usr/bin/perl

package StrongBlock;

use strict;
use OpenGL ':all';
use Util;

use base qw(Block CollisionObj);


# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	# �u���b�N�̏ꏊ���擾
	my $row = shift;
	my $column = shift;
	
	# �����o�ϐ�
	my $block = {};
	$block->{pos_x} = ( $Block::WIDTH + $Block::INTERVAL_X ) * $row + $Block::OFFSET_X;
	$block->{pos_y} = ( $Block::HEIGHT + $Block::INTERVAL_Y ) * $column + $Block::OFFSET_Y;
	$block->{destroyed} = $Util::FALSE;
	$block->{penetrate} = $Util::FALSE;
	$block->{score} = 100;
	$block->{durability} = shift;
	
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $block, $this;
	
	return $block;
}

# �`��
sub draw
{
	my $this = shift;
	
	if( $this->{destroyed} == $Util::FALSE ){
		glColor3f( 1.0, 0.0, 0.0 );
		glBegin( GL_LINE_LOOP );
		glVertex2f( $this->{pos_x} - 1, $this->{pos_y} );
		glVertex2f( $this->{pos_x} + $Block::WIDTH, $this->{pos_y} );
		glVertex2f( $this->{pos_x} + $Block::WIDTH, $this->{pos_y} + $Block::HEIGHT );
		glVertex2f( $this->{pos_x}, $this->{pos_y} + $Block::HEIGHT );
		glEnd();
		glRasterPos2f( $this->{pos_x} + 9.0, $this->{pos_y} + 10.5 );
		glutBitmapCharacter( GLUT_BITMAP_HELVETICA_10, ord ( $this->{durability} ) );
	}
}

# �X�V
sub update
{
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
	
	return $Block::WIDTH;
}

# �������擾����
sub get_height
{
	my $this = shift;
	
	return $Block::HEIGHT;
}

# �j�󂳂ꂽ��
sub destroyed
{
	my $this = shift;
	
	return $this->{destroyed};
}

# �ђʂ��邩
sub penetrate
{
	my $this = shift;
	
	return $this->{penetrate};
}

# �{�[���ƏՓ˂������̏���
sub process_collision_with_ball
{
	my $this = shift;
	
	--$this->{durability};
	if( $this->{durability} <= 0 ){
		$this->{destroyed} = $Util::TRUE;
	}
}

# ���_���擾
sub get_score
{
	my $this = shift;
	
	if( $this->{durability} <= 0 ){
		return $this->{score};
	}
	else{
		return 1;
	}
}

1;