-- for optimization levels:
-- 0 - normal draw calls without any tricks
-- 1 - using image array
-- 2 - batching image array drawcalls

OPTIMIZED = 2
WIN_SIZE = {1600, 900}
WIN_W, WIN_H = unpack(WIN_SIZE)
NUM_SPRITES_PER_CLICK = 500
SPEED = 200