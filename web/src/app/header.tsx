import React from 'react';
import { withStyles, WithStyles, Theme, createStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import FolderOpen from '@material-ui/icons/FolderOpen';
import IconButton from '@material-ui/core/IconButton';
import Tooltip from '@material-ui/core/Tooltip';

const styles = (theme: Theme) => createStyles({
  title: {
    flexGrow: 1
  }
});

export interface OwnProps {
  fileName: string;
  onPickFile: () => void;
  // onFilePicked: (event: React.ChangeEvent<HTMLInputElement>) => void;
};

export type Props = OwnProps & WithStyles<typeof styles>;

export const Header: React.FunctionComponent<Props> = ({ classes, fileName, onPickFile /* onFilePicked */ }) => (
  <AppBar position="static">
    <Toolbar>
      <Typography variant="h6" className={classes.title}>
        {fileName}
      </Typography>

      <Tooltip title="Open" aria-label="open">
        <IconButton component="span" onClick={onPickFile}>
          <FolderOpen />
        </IconButton>
      </Tooltip>

      {/* <input onChange={onFilePicked} style={{ display: 'none' }} id="file-picker" type="file" accept=".trx" />
      <label htmlFor="file-picker">
        <Tooltip title="Open" aria-label="open">
          <IconButton component="span">
            <FolderOpen />
          </IconButton>
        </Tooltip>
      </label> */}
    </Toolbar>
  </AppBar>
);

export default withStyles(styles)(Header);
