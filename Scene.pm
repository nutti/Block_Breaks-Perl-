#!/usr/bin/perl

use strict;
use OpenGL ':all';

package Scene;

# コンストラクタ
sub new
{
	# パッケージ名
	my $this = shift;
	
	# メンバ変数
	my $scene = {};
	
	# パッケージ名とオブジェクト名を関連させる
	bless $scene, $this;
	
	return $scene;
}

sub draw
{
	main::glVertex2f( -0.5, 0.5 );
	main::glVertex2f( -0.5, -0.5 );
	main::glVertex2f( 0.9, 0 );
}

1;