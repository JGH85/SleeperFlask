"""added status to player

Revision ID: 137ec984db24
Revises: 
Create Date: 2022-12-07 12:24:58.859870

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '137ec984db24'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('player', schema=None) as batch_op:
        batch_op.add_column(sa.Column('status', sa.String(length=50), nullable=True))
        batch_op.alter_column('full_name',
               existing_type=sa.VARCHAR(length=20),
               type_=sa.String(length=50),
               existing_nullable=False)
        batch_op.alter_column('search_full_name',
               existing_type=sa.VARCHAR(length=40),
               type_=sa.String(length=50),
               existing_nullable=True)

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('player', schema=None) as batch_op:
        batch_op.alter_column('search_full_name',
               existing_type=sa.String(length=50),
               type_=sa.VARCHAR(length=40),
               existing_nullable=True)
        batch_op.alter_column('full_name',
               existing_type=sa.String(length=50),
               type_=sa.VARCHAR(length=20),
               existing_nullable=False)
        batch_op.drop_column('status')

    # ### end Alembic commands ###