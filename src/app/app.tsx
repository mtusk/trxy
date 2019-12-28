import React, { useState } from 'react';
import CssBaseline from '@material-ui/core/CssBaseline';
import useMediaQuery from '@material-ui/core/useMediaQuery';
import { ThemeProvider, createMuiTheme } from '@material-ui/core/styles';
import Container from '@material-ui/core/Container';
import TestResults, { getTestResultsFromTestRun } from './test-results';
import Header from './header';
import { readTestRun } from '../trx';
import { TestResult } from './test-result';

const App: React.FC = () => {
  const prefersDarkMode = useMediaQuery('(prefers-color-scheme: dark)');

  const theme = React.useMemo(
    () =>
      createMuiTheme({
        palette: {
          type: prefersDarkMode ? 'dark' : 'light',
        },
      }),
    [prefersDarkMode],
  );

  const [fileName, setFileName] = useState<string>('trxy');
  const [testResults, setTestResults] = useState<TestResult[]>([]);

  const handleFilePicked = async (event: React.ChangeEvent<HTMLInputElement>) => {
    const files = event.target.files;

    if (files && files.length > 0) {
      const file = files[0];
      const testRun = await readTestRun(file);
      const testResults = testRun === undefined
        ? [] as TestResult[]
        : getTestResultsFromTestRun(testRun);

      console.log('read test results: ', testResults);
      setFileName(file.name);
      setTestResults(testResults);
    }
  };

  return (
    <React.Fragment>
      <ThemeProvider theme={theme}>
        <CssBaseline />
        {/* <Container maxWidth="lg"> */}
          <Header fileName={fileName} onFilePicked={handleFilePicked} />
          <TestResults testResults={testResults} />
        {/* </Container> */}
      </ThemeProvider>
    </React.Fragment>
  );
}

export default App;
