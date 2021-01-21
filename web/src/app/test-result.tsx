import React from 'react';
import { withStyles, WithStyles, Theme, createStyles } from '@material-ui/core/styles';

export enum KnownTestOutcomes { Passed, Failed };

export interface TestResult {
  id: string;
  testRun?: string;
  testName?: string;
  result?: KnownTestOutcomes | string;
  duration?: string;
  computerName?: string;
  startTime?: string;
  endTime?: string;
  errorMessage?: string;
  errorStackTrace?: string;
}

const styles = (theme: Theme) => createStyles({
  //
});

export interface OwnProps {
  testResult: TestResult
};

export type Props = OwnProps & WithStyles<typeof styles>;

export const TestResultComponent: React.FunctionComponent<Props> = ({ testResult, classes }) => (
  <pre>
    <code>
      {JSON.stringify(testResult, null, 2)}
    </code>
  </pre>
);

export default withStyles(styles)(TestResultComponent);
