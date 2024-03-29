"""changed ir column name

Revision ID: 183d46d74f9a
Revises: b7c7d334460b
Create Date: 2023-01-11 12:26:50.566288

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '183d46d74f9a'
down_revision = 'b7c7d334460b'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('roster_player', schema=None) as batch_op:
        batch_op.add_column(sa.Column('is_franchised', sa.Boolean(), nullable=True))
        batch_op.add_column(sa.Column('is_ir', sa.Boolean(), nullable=True))
        batch_op.drop_column('is_IR')
        batch_op.drop_column('is_Franchised')

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('roster_player', schema=None) as batch_op:
        batch_op.add_column(sa.Column('is_Franchised', sa.BOOLEAN(), autoincrement=False, nullable=True))
        batch_op.add_column(sa.Column('is_IR', sa.BOOLEAN(), autoincrement=False, nullable=True))
        batch_op.drop_column('is_ir')
        batch_op.drop_column('is_franchised')

    # ### end Alembic commands ###
